import 'dart:io';
import 'package:dio_supabase/utils/date_extensions.dart';
import 'package:flutter/material.dart';
import 'package:dio_supabase/model/profile.dart';
import 'package:dio_supabase/utils/profile_api.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetailPage extends StatefulWidget {
  final MyProfile? profile;

  const ProfileDetailPage({super.key, this.profile});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  DateTime? _selectedDate;
  File? _selectedImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.profile != null) {
      _nameController.text = widget.profile!.name;
      _selectedDate = widget.profile!.birthday;
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      setState(() => _selectedImage = File(pickedFile.path));
    }
  }

  Future<void> _pickDate() async {
    final initialDate = _selectedDate ?? DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (newDate != null) {
      setState(() => _selectedDate = newDate);
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate() ||
        _selectedDate == null ||
        (_selectedImage == null && widget.profile == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final profile = MyProfile(
        id: widget.profile?.id ?? DateTime.now().millisecondsSinceEpoch % 10000,
        name: _nameController.text.trim(),
        imageUrl: widget.profile?.imageUrl ?? '',
        birthday: _selectedDate!,
      );

      bool success;
      if (widget.profile == null) {
        success = await addProfileWithImage(_selectedImage!, profile);
      } else if (_selectedImage != null) {
        success = await updateProfileWithImage(_selectedImage, profile);
      } else {
        success = await updateProfile(profile);
      }

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Profile ${widget.profile == null ? 'added' : 'updated'} successfully'),
          ),
        );
        Navigator.of(context).pop(true);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save profile')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving profile: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.profile != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Profile' : 'Add Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: AbsorbPointer(
          absorbing: _isLoading,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : (widget.profile?.imageUrl.isNotEmpty ?? false)
                            ? NetworkImage(widget.profile!.imageUrl)
                            : null,
                    child: _selectedImage == null &&
                            (widget.profile?.imageUrl.isEmpty ?? true)
                        ? const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter a name' : null,
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text(_selectedDate != null
                      ? 'Birthday: ${_selectedDate!.toLocal().toShortDateString()}'
                      : 'Select Birthday'),
                  onTap: _pickDate,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: _saveProfile,
                  icon: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Icon(Icons.save),
                  label: Text(isEditing ? 'Update Profile' : 'Add Profile'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

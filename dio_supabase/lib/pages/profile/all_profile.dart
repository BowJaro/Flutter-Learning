// lib/pages/profile/all_profile_page.dart

import 'package:dio_supabase/pages/profile/profile_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:dio_supabase/model/profile.dart';
import 'package:dio_supabase/utils/profile_api.dart';
import 'package:dio_supabase/utils/date_extensions.dart';

class AllProfilePage extends StatefulWidget {
  const AllProfilePage({super.key});

  @override
  State<AllProfilePage> createState() => _AllProfilePageState();
}

class _AllProfilePageState extends State<AllProfilePage> {
  List<MyProfile> profileList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfiles();
  }

  Future<void> fetchProfiles() async {
    try {
      final profiles = await getAllProfiles();
      setState(() {
        profileList = profiles;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching profiles: $e')),
      );
    }
  }

  Future<void> _deleteProfile(int id, int index) async {
    try {
      final success = await deleteProfile(id);
      if (success && mounted) {
        setState(() => profileList.removeAt(index));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile deleted successfully')),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete profile')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting profile: $e')),
      );
    }
  }

  Future<void> _refreshProfiles() async {
    setState(() => isLoading = true);
    await fetchProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Profiles'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refreshProfiles,
              child: ListView.builder(
                itemCount: profileList.length,
                itemBuilder: (context, index) {
                  final profile = profileList[index];
                  return Dismissible(
                    key: Key(profile.id.toString()),
                    background: _buildDeleteBackground(),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: const Text(
                              'Are you sure you want to delete this profile?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      );
                    },
                    onDismissed: (direction) {
                      _deleteProfile(profile.id, index);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(profile.imageUrl),
                      ),
                      title: Text(profile.name),
                      subtitle: Text(
                        'Birthday: ${profile.birthday.toLocal().toShortDateString()}',
                      ),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfileDetailPage(profile: profile),
                          ),
                        );
                        if (result == true) {
                          _refreshProfiles();
                        }
                      },
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileDetailPage(),
            ),
          );
          if (result == true) {
            _refreshProfiles();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}

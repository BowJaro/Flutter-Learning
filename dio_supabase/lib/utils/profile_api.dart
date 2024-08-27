import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_supabase/utils/apikey.dart';
import 'package:dio_supabase/model/profile.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final SupabaseClient supabase = Supabase.instance.client;

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    },
  ),
);

Future<List<MyProfile>> getAllProfiles() async {
  try {
    final response = await dio.get('/Profile?select=*');
    if (response.statusCode == 200) {
      // Cast the response data to a list of dynamic for flexibility

      final result = (response.data as List)
          .map((profileMap) => MyProfile.fromJson(profileMap))
          .toList();
      return result;
    } else {
      throw Exception('Failed to fetch profiles: ${response.statusCode}');
    }
  } on DioException catch (e) {
    throw Exception('Error fetching profiles: ${e.message}');
  }
}

// Add a new profile
Future<bool> addProfile(MyProfile profile) async {
  try {
    final response = await dio.post('/Profile', data: profile.toJson());
    return response.statusCode == 201;
  } catch (e) {
    throw Exception('Error adding profile: $e');
  }
}

Future<bool> addProfileWithImage(File imageFile, MyProfile profile) async {
  try {
    String imageUrl = await uploadImage(imageFile);
    profile.imageUrl = "$rootUrl/storage/v1/object/public/$imageUrl";
    final response = await dio.post('/Profile', data: profile.toJson());
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return true;
    } else {
      throw Exception('Error adding profile: ${response.statusCode}');
    }
  } catch (e) {
    // Handle specific errors from uploadImage or the API call
    throw Exception('Error adding profile with image: $e');
  }
}

// Update an existing profile
Future<bool> updateProfile(MyProfile profile) async {
  try {
    final response =
        await dio.patch('/Profile?id=eq.${profile.id}', data: profile.toJson());
    return response.statusCode == 200 || response.statusCode == 204;
  } catch (e) {
    throw Exception('Error updating profile: $e');
  }
}

Future<bool> updateProfileWithImage(File? imageFile, MyProfile profile) async {
  try {
    if (imageFile != null) {
      String imageUrl = await uploadImage(imageFile);
      profile.imageUrl = "$rootUrl/storage/v1/object/public/$imageUrl";
    }
    return await updateProfile(profile);
  } catch (e) {
    throw Exception('Error updating profile with image: $e');
  }
}

// Delete a profile
Future<bool> deleteProfile(int id) async {
  try {
    final response = await dio.delete('/Profile?id=eq.$id');
    return response.statusCode == 200;
  } catch (e) {
    throw Exception('Error deleting profile: $e');
  }
}

Future<String> uploadImage(File imageFile) async {
  try {
    String fileName = basename(
        imageFile.path + DateTime.now().millisecondsSinceEpoch.toString());
    final response = await supabase.storage.from('images').upload(
          'profiles/$fileName',
          imageFile,
        );

    return response;
  } catch (e) {
    throw Exception('Error uploading image: $e');
  }
}

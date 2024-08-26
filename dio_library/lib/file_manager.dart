import 'dart:io';
import 'package:dio_library/request_permission.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

Future downloadFile() async {
  if (await requestPermission(permission: Permission.storage) ==
      PermissionStatus.granted) {
    try {
      var dio = Dio();
      String urlPath =
          "https://filesampleshub.com/download/document/txt/sample1.txt";

      Directory directory = await getApplicationDocumentsDirectory();
      String savePath = '${directory.path}/file.txt';

      print("Downloading file to: $savePath");

      Response response = await dio.download(
        urlPath,
        savePath,
      );

      print("Download complete. Response: $response");
      return "Successfully downloaded";
    } on DioException catch (e) {
      print("Download failed: ${e.message}");
      return "Failed to download";
    } catch (error) {
      print("Unexpected error: $error");
      return "Failed to download";
    }
  } else {
    print("Storage permission denied. Download cannot proceed.");
  }
}

Future uploadFile() async {
  if (await requestPermission(permission: Permission.storage) ==
      PermissionStatus.granted) {
    try {
      var dio = Dio();

      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path ?? "");
        String fileName = file.path.split("/").last;
        String filePath = file.path;

        var data = FormData.fromMap({
          'key': 'f4295e2a276f0e0e3214fb5539825e5f',
          'image': await MultipartFile.fromFile(filePath, filename: fileName),
        });

        var response = await dio.post("https://api.imgbb.com/1/upload",
            data: data, onSendProgress: (int sent, int total) {
          print("Send/Total: $sent / $total");
        });
        print("This is response from uploadFile $response");
        return "Successfully uploaded";
      } else {
        print("Result is null");
        return "Choose an image to upload";
      }
    } catch (error) {
      print("Error when uploading file $error");
      return "Failed to upload";
    }
  }
}

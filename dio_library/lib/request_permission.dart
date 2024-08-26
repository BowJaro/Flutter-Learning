import 'package:permission_handler/permission_handler.dart';

Future<dynamic> requestPermission({required Permission permission}) async {
  final status = await permission.status;
  if (status.isGranted) {
  } else if (status.isDenied) {
    if (await permission.request().isGranted) {
    } else {}
  } else {}
  return status;
}

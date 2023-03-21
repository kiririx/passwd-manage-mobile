import 'package:flutter/services.dart';

class ICloudHelper {
  static const platform = MethodChannel('com.example.icloud/save');

  Future<void> saveFileToICloud(String filename, String content) async {
    try {
      final result = await platform.invokeMethod('saveFileToICloud', {
        'filename': filename,
        'content': content,
      });
      print(result);
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }
}

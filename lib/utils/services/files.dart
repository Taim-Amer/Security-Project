import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';

class TFileServices {
  TFileServices._();

  static String fileName = "";
  static bool isFilePicked = false;
  static Uint8List fileBytes = Uint8List(0);
  static String path = "";

  static Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result != null) {
        isFilePicked = true;
        fileName = result.files.single.name;
        fileBytes = result.files.single.bytes ?? Uint8List(0);
        path = result.files.single.path ?? "";
      } else {
        isFilePicked = false;
      }
    } catch (e) {
      isFilePicked = false;
    }
  }
}

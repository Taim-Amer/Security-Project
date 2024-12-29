import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController{
  static ImagePickerController get instance => Get.find();


  final ImagePicker picker = ImagePicker();
  final Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  Future<void> pickImage() async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imageBytes.value = await file.readAsBytes();
    }
  }
}
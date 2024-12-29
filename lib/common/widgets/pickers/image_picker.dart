import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:security_project/common/controllers/image_picker_controller.dart';
import 'package:security_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:security_project/utils/constants/image_strings.dart';

class TImagePicker extends StatelessWidget {
  const TImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ImagePickerController.instance;

    return Center(
      child: GestureDetector(
        onTap: () {
          controller.pickImage();
        },
        child: ClipOval(
          child: TCircularContainer(
            width: 150.w,
            height: 150.h,
            child: Obx(() => controller.imageBytes.value != null ? Image.memory(
              controller.imageBytes.value!,
              fit: BoxFit.contain,
            ) : Image.asset(
              TImages.profile,
              fit: BoxFit.contain,
            )),
          ),
        ),
      ),
    );
  }
}

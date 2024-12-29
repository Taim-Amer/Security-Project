import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:security_project/utils/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(color: TColors.primary,);
    // return LoadingAnimationWidget.waveDots(color: TColors.primary, size: 70);
  }
}

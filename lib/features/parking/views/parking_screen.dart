import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:security_project/common/styles/spacing_styles.dart';
import 'package:security_project/common/widgets/appbar/appbar.dart';
import 'package:security_project/features/parking/controllers/parking_controller.dart';
import 'package:security_project/utils/constants/sizes.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    ParkingController.instance.timeController.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: ParkingController.instance.timeController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.calendar),
                      labelText: "Date",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                controller: ParkingController.instance.slotController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.code),
                  labelText: "Slot",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () => ParkingController.instance.reverseParking(),
                  child: const Text("Book"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

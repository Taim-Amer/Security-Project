import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_project/features/parking/controllers/parking_controller.dart';
import 'package:security_project/features/parking/views/payment_screen.dart';

class HandshakingScreen extends StatelessWidget {
  HandshakingScreen({super.key});
  final parkingController = ParkingController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Handshaking")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await parkingController.performHandshaking();
              Get.snackbar("Success", "Handshaking completed successfully.");
              Get.to(() => PaymentScreen());
            } catch (e) {
              Get.snackbar("Error", "Failed to complete handshaking.");
            }
          },
          child: Text("Start Handshaking"),
        ),
      ),
    );
  }
}

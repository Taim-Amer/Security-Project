import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_project/features/parking/controllers/parking_controller.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  PaymentConfirmationScreen({super.key});

  final parkingController = ParkingController.instance;

  @override
  Widget build(BuildContext context) {
    final result = parkingController.paymentResult.value;

    return Scaffold(
      appBar: AppBar(title: Text("Payment Confirmation")),
      body: Center(
        child: result != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Payment Successful!"),
            Text("Transaction ID: ${result.data?.garageId}"),
            Text("Amount: ${result.data?.amount}"),
            Text("Status: ${result.status}"),
          ],
        )
            : Text("No payment data available."),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_project/features/parking/controllers/parking_controller.dart';

class PaymentScreen extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final parkingController = ParkingController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: currencyController,
              decoration: InputDecoration(labelText: "Currency"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final amount = int.parse(amountController.text);
                  final currency = currencyController.text;

                  // بيانات الدفع
                  final paymentData = {
                    'amount': amount,
                    'currency': currency,
                  };

                  await parkingController.processPayment(paymentData);
                  Get.snackbar("Success", "Payment processed successfully.");
                } catch (e) {
                  Get.snackbar("Error", "Failed to process payment.");
                }
              },
              child: Text("Pay"),
            ),
          ],
        ),
      ),
    );
  }
}

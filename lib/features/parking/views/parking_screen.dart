import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security_project/features/authentication/controllers/session_key_controller.dart';
import 'package:security_project/features/parking/controllers/parking_controller.dart';

class ParkingPage extends StatelessWidget {
  ParkingPage({super.key});
  final ParkingController parkingController = ParkingController.instance;
  final SessionKeyController sessionKeyController = SessionKeyController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await sessionKeyController.getSessionKey();
              },
              child: Text("Fetch Session Key"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(labelText: "Parking Slot"),
            ),
            TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(labelText: "Time (e.g., 2024-12-27 10:00)"),
            ),
            ElevatedButton(
              onPressed: () async {
                await parkingController.reverseParking('A12', '2024-12-27 10:00');
              },
              child: Text("Book Parking Spot"),
            ),
            Obx(() {
              final model = parkingController.reverseParkingModel.value;
              return model.status != null
                  ? Text(
                "Booking Status: ${model.status! ? 'Confirmed' : 'Failed'}",
              )
                  : SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}

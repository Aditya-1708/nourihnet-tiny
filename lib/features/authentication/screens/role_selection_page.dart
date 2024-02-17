import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:nourishnet/classes/role_enum.dart';
import 'package:nourishnet/features/authentication/screens/first_page.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Role'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(RootPage(role: Role.donor,));
              },
              child: const Text('Donor'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(RootPage(role: Role.user,));
              },
              child: const Text('Receiver'),
            ),
          ],
        ),
      ),
    );
  }
}

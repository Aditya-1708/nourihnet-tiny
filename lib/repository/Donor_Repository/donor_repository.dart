import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourishnet/classes/role_enum.dart';
import 'package:nourishnet/features/authentication/models/donor_model.dart';
import 'package:nourishnet/features/donorhome/screens/home_page.dart';

class DonorRepository extends GetxController {
  static DonorRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createDonor(DonorModel donor) async {
    try {
      await _db.collection('Donors').add(donor.toJson()).whenComplete(() {
            Get.snackbar(
              "Success",
              "Your account has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            );
            Get.to(const DonorHomePage());
          });
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
      return null;
    }
  }
  Future<Role?> getDonorRole(String email) async {
    try {
      DocumentSnapshot donorSnapshot =
          await _db.collection('Donors').doc(email).get();
      if (donorSnapshot.exists) {
        String? roleString = donorSnapshot.get('role');
        Role? role;
        if (roleString == 'user') {
          role = Role.user;
        } else if (roleString == 'donor') {
          role = Role.donor;
        }
        return role;
      } else {
        return null;
      }
    } catch (error) {
      print("Error fetching Donor role: $error");
      return null;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourishnet/classes/role_enum.dart';
import 'package:nourishnet/features/authentication/models/user_model.dart';
import 'package:nourishnet/features/userhome/screens/home_page.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    try {
      await _db.collection('Users').add(user.toJson()).whenComplete(() {
            Get.snackbar(
              "Success",
              "Your account has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            );
            Get.to(const UserHomePage());
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
      // Return a value to fulfill the requirement of the catchError callback
      return null; // You can return null or any other appropriate value
    }
  }

  Future<Role?> getUserRole(String email) async {
    try {
      DocumentSnapshot userSnapshot =
          await _db.collection('Users').doc(email).get();
      if (userSnapshot.exists) {
        String? roleString = userSnapshot.get('role');
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
      print("Error fetching user role: $error");
      return null;
    }
  }
}

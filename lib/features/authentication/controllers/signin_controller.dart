import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourishnet/repository/Authentication_Repository/authentication_repository.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  void signin(String email, String password) {
    AuthenticationRepository.instance
        .signinUserWithEmailAndPassword(email, password);
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nourishnet/classes/role_enum.dart';
import 'package:nourishnet/features/authentication/models/user_model.dart';
import 'package:nourishnet/repository/Authentication_Repository/authentication_repository.dart';
import 'package:nourishnet/repository/User_Repository/user_repository.dart';

class ContinueController extends GetxController {
  static ContinueController get instance => Get.find();
  final userRepo = Get.put(UserRepository());

  void continueWithGoogle(Role role) async {
    await AuthenticationRepository.instance.continueWithGoogle(role);
  }
}

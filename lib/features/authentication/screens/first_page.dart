import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nourishnet/classes/role_enum.dart';
import 'package:nourishnet/features/authentication/controllers/continue_with_google.dart';
import 'package:nourishnet/features/authentication/screens/sign_in.dart';
import 'package:nourishnet/features/authentication/screens/sign_up.dart';

class RootPage extends StatefulWidget {
  final Role role;
  const RootPage({Key? key, required this.role}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ContinueController controller = Get.put(ContinueController());
  User? _user;

  // Toggle variables
  List<bool> isSelected = [true, false]; // Default: Donor selected

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 236),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 198, 168, 105),
        title: const Text(
          'NourishNet',
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSignInButton(context),
                const SizedBox(width: 30),
                _buildSignUpButton(context,widget.role),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                controller.continueWithGoogle(widget.role);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  color: const Color(0xFF597E52),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Continue With Google',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignIn(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: const Color(0xFF597E52),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context,Role role) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>SignUp(role: role,),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: const Color(0xFF597E52),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

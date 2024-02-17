import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourishnet/features/authentication/controllers/signin_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final SigninController controller = Get.put(SigninController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 236),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 198, 168, 105),
          title: const Text(
            'Sign In',
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: 'Bloodbond@example.com',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter email' : null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: controller.password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: 'Enter password',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter password' : null;
                    },
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.signin(controller.email.text.trim(),
                            controller.password.text.trim());
                      }
                    },
                    minWidth: double.infinity,
                    color: const Color.fromARGB(255, 89, 126, 82),
                    textColor: Colors.white,
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

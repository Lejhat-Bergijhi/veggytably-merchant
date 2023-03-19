import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/signup_page.dart';
import 'package:email_validator/email_validator.dart';

import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: Column(children: [
              const SizedBox(height: 50),

              // logo
              //   Icon(Icons.lock,
              //   size:100,
              // ),
              const SizedBox(height: 100),

              // Text: VeggyMerch
              const Text(
                'VeggyMerch',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Text: Powered by Veggytably
              const Text('Powered by Veggytably',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20),

              // Input Email or Telephone Number
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => EmailValidator.validate(value!)
                      ? null
                      : "Please enter a valid email",
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Input Password
              SizedBox(
                  width: 300,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
              const SizedBox(height: 10),

              // Login button
              SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    AuthController.to.login(
                      emailController,
                      passwordController,
                    );
                    // emailController.clear();
                    // passwordController.clear();
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Text: Don't have an account?
              const Text(
                'Don\'t have an account?',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),

              // Text: Sign Up
              GestureDetector(
                onTap: () {
                  Get.offAll(() => const SignUpPage(),
                      transition: Transition.fade);
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ])),
          ),
        ));
  }
}

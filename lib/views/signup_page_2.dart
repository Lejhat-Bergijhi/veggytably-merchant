import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/login_page.dart';
import 'package:email_validator/email_validator.dart';

import '../controllers/auth_controller.dart';
import '../widgets/input_text.dart';

class SignUpPage2 extends StatefulWidget {
  const SignUpPage2({super.key});

  @override
  State<SignUpPage2> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage2> {
  AuthController authController = Get.put(AuthController());
  TextEditingController ownerUsernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController merchantUsernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/Subtract.png',
                  width: 39.0,
                  height: 35.93,
                ),
              ),
            ),
            const SizedBox(height: 5),

            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),

            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Manage your Bussiness Anywhere and Everywhere.',
                  style: TextStyle(
                    color: Color.fromARGB(206, 47, 47, 47),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'MERCHANT’S PHOTO',
                  style: TextStyle(
                    color: Color.fromARGB(131, 88, 83, 83),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Text:
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(36),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/imageup.png',
                    width: 130.0,
                    height: 130.0,
                  ),
                  const Text(
                    'Upload from your device',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(
                            119, 219, 218, 218), // warna border
                        width: 1.0, // ketebalan border
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color.fromARGB(119, 219, 218, 218),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.camera_alt_rounded, size: 15),
                          const SizedBox(width: 5),
                          const Text(
                            'Camera',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(
                            119, 219, 218, 218), // warna border
                        width: 1.0, // ketebalan border
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color.fromARGB(119, 219, 218, 218),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.cloud_upload_sharp, size: 15),
                          const SizedBox(width: 5),
                          const Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  authController.signUp(
                    ownerUsernameController,
                    emailController,
                    telephoneController,
                    passwordController,
                    merchantUsernameController,
                    addressController,
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff70cb88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
                width: 219,
                height: 21,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => const LoginPage(),
                            transition: Transition.fade);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff356631),
                          //underline
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}

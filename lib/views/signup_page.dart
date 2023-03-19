import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/login_page.dart';
import 'package:email_validator/email_validator.dart';

import '../controllers/auth_controller.dart';
import '../widgets/input_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        child: SingleChildScrollView(
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
            ),
            SizedBox(height: 10),

            // Text: Powered by Vegytably
            Text('Manage your Bussiness Anywhere and Everywhere.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 20),

            Text('Merchant’s Data',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 10),

            //Input nama
            Container(
              width: 300,
              height: 45,
              child: InputTextField(ownerUsernameController, "Your Name", 'Rubik',),
            ),
            SizedBox(height: 10),

            // Input Email or Telephone Number
            Container(
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
            SizedBox(height: 10),

            //input no telp
            Container(
              width: 300,
              height: 45,
              child: InputTextField(telephoneController, "Telephone Number", 'Rubik',),
            ),
            SizedBox(height: 10),

            // Input Password
            Container(
              width: 300,
              height: 45,
              child: Container(
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
            ),
            SizedBox(height: 20),

            Text('Restaurant’s Data',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 10),

            Container(
              width: 300,
              height: 45,
              child: InputTextField(
                merchantUsernameController,
                "Restaurant Name", 'Rubik',
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 300,
              height: 45,
              child: InputTextField(
                addressController,
                "Restaurant Address", 'Rubik',

              ),
              // Text:
              const SizedBox(height: 10),

              //Input nama
              SizedBox(
                width: 300,
                child: InputTextField(ownerUsernameController, "Name"),
              ),
              const SizedBox(height: 10),

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

              //input no telp
              SizedBox(
                width: 300,
                child: InputTextField(telephoneController, "Telephone Number"),
              ),
              const SizedBox(height: 10),

              // Input Password
              SizedBox(
                width: 300,
                child: SizedBox(
                  width: 300,
                  child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.only(left: 36),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'RESTAURANT’S DATA',
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

              SizedBox(
                width: 300,
                child: InputTextField(
                  merchantUsernameController,
                  "Restaurant Name",
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: 300,
                child: InputTextField(
                  addressController,
                  "Restaurant Address",
                ),
              ),
              const SizedBox(height: 10),

              // signup button
              SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    AuthController.to.signUp(
                      ownerUsernameController,
                      emailController,
                      telephoneController,
                      passwordController,
                      merchantUsernameController,
                      addressController,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff70cb88),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/login_page.dart';

import '../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(height: 20),

            // logo
            Icon(
              Icons.account_circle,
              size: 100,
            ),
            SizedBox(height: 20),

            // Text: VegyMerch
            Text(
              'Nandarelle Aurora Trevor',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Text: Powered by Vegytably
            Text('+62 89101112131',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                )),
            SizedBox(height: 10),

            // Input Email or Telephone Number
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Edit Profile',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Input Password
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Notification',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Order’s Recapitulation',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Text: Sign Up
            GestureDetector(
              onTap: () {
                authController.logout();
                Get.offAll(() => LoginPage());
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 236, 41, 41),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

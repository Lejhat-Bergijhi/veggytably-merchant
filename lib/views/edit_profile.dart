import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/profile_page.dart';
import 'package:vegytably_merchant/widgets/input_text.dart';

import '../controllers/merchant_controller.dart';
import '../models/merchant.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    MerchantController merchantController = Get.find();

    Merchant merchant = merchantController.merchant;

    TextEditingController usernameController =
        TextEditingController(text: merchant.username);
    TextEditingController emailController =
        TextEditingController(text: merchant.email);
    TextEditingController phoneController =
        TextEditingController(text: merchant.phone);
    TextEditingController restaurantNameController =
        TextEditingController(text: merchant.restaurantName);
    TextEditingController restaurantAddressController =
        TextEditingController(text: merchant.restaurantAddress);

    var name = '/assets/ProfPic.png';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12.0, top: 10),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 50,
        leadingWidth: 30,
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        padding: const EdgeInsets.only(top: 11, left: 40, right: 40),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 30),

            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/EditProfPic.png'),
                ),
                Positioned(
                  bottom: -12,
                  child: InkWell(
                    onTap: () {
                      // showModal();
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      color: Color.fromARGB(255, 23, 47, 44),
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Merchant's Data",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                InputTextField(
                  textEditingController: usernameController,
                  hintText: 'Name',
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                InputTextField(
                  textEditingController: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                InputTextField(
                  textEditingController: phoneController,
                  hintText: 'Telephone Number',
                ),
                const SizedBox(height: 10),
              ],
            ),
            // Restaurant Data
            const SizedBox(height: 10),
            const Text(
              "Restaurant's Data",
              style: TextStyle(
                color: Color(0xff9f9f9f),
                fontSize: 10,
                fontFamily: "Rubik",
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            Container(
              // width: 300,
              child: InputTextField(
                textEditingController: restaurantNameController,
                hintText: "Name",
              ),
            ),
            const SizedBox(height: 5),
            Container(
              // width: 300,
              child: InputTextField(
                textEditingController: restaurantAddressController,
                hintText: "Address",
              ),
            ),
            const SizedBox(height: 10),

            // Login button
            Container(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  merchantController.updateProfile(
                      usernameController,
                      emailController,
                      phoneController,
                      restaurantNameController,
                      restaurantAddressController);
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff70cb88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //       height: 87.7,
      //       decoration: BoxDecoration(

      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),

      //           boxShadow: [
      //           BoxShadow(color: Color.fromRGBO(0,0,0,230), spreadRadius: 0, blurRadius: 20),
      //           ],

      //       ),

      //       child: ClipRRect(

      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),

      //           child: CustomBottomNavigationBar(initialIndex: 3),
      //       )
      // )
    );
  }
}

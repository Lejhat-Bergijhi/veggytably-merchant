import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/home_page.dart';
import 'package:vegytably_merchant/widgets/bottom_navbar.dart';
import 'package:vegytably_merchant/widgets/profile_menu.dart';
import 'package:vegytably_merchant/widgets/upload_pic.dart';
import 'package:vegytably_merchant/widgets/input_text.dart';
import 'package:dotted_border/dotted_border.dart';
import '../widgets/menu_checkbox.dart';

class AddMenu extends StatelessWidget {
  const AddMenu({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameFoodController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(() => HomePage(), transition: Transition.fade);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12.0, top: 10),
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Add Menu",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 30,
        leadingWidth: 30,
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        padding: EdgeInsets.only(top: 11, left: 40, right: 40),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Detail Menu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  MenuCheckbox('Menu Ready Stock'),
                ],
              ),
            ),
            SizedBox(height: 30),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TITLE",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                Container(
                  // width: 300,
                  child: InputTextField(
                    textEditingController: nameFoodController,
                    hintText: 'Cth: Ayam goyang + Nasi',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "DESKRIPSI",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                Container(
                  // width: 300,
                  child: InputTextField(
                    textEditingController: descController,
                    hintText: 'Cth: Ayam digoyang-goyangin',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "PRICE",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                Container(
                  // width: 300,
                  child: InputTextField(
                    textEditingController: priceController,
                    hintText: 'Cth: 21.999',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "MENU PICTURE",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width - 40 * 2,
                  child: DottedBorder(
                    dashPattern: [8, 8],
                    radius: Radius.circular(8),
                    child: Container(
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              // Profile Image preview
                              Icon(
                                Icons.image_outlined,
                                size: 150,
                              ),
                              SizedBox(height: 19),
                              Text(
                                "Upload Image From Your Device",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 19),
                              // Camera Button
                              Container(
                                width: MediaQuery.of(context).size.width -
                                    40 * 2 -
                                    23 * 2,
                                height: 36,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffefefef),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Spacer(),
                                      Container(
                                          width: 20,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            size: 20,
                                          )),
                                      SizedBox(width: 10),
                                      Text(
                                        "Camera",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 1),
                              Container(
                                  width: MediaQuery.of(context).size.width -
                                      40 * 2 -
                                      23 * 2,
                                  height: 36,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xffefefef),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        Container(
                                            width: 22,
                                            height: 15,
                                            child: Icon(
                                              Icons.photo_library,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              size: 20,
                                            )),
                                        SizedBox(width: 10),
                                        Text(
                                          "Gallery",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  )),
                              SizedBox(height: 24),
                            ])),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "FOOD REQUIREMENT",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      MenuCheckbox('Dairy-Free (no milk products)'),
                      const SizedBox(height: 10),
                      MenuCheckbox('Meat-Free'),
                      const SizedBox(height: 10),
                      MenuCheckbox('Fish-Free'),
                      const SizedBox(height: 10),
                      MenuCheckbox('Glutten-Free'),
                      const SizedBox(height: 10),
                      MenuCheckbox('Egg-Free'),
                      const SizedBox(height: 10),
                      MenuCheckbox('Nut-Free'),
                    ],
                  ),
                ),
              ],
            ),
            // Input Email or Telephone Number
            SizedBox(height: 20),

            // Login button
            Container(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => HomePage(), transition: Transition.fade);
                  // emailController.clear();
                  // passwordController.clear();
                },
                child: Text(
                  'Add Menu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff70cb88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
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

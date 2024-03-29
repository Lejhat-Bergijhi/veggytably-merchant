import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/controllers/merchant_controller.dart';
// import 'package:vegytably_merchant/controllers/merchant_controller.dart';
import 'package:vegytably_merchant/views/login_page.dart';
// import 'package:vegytably_merchant/views/restriction_page1.dart';
import 'package:vegytably_merchant/widgets/profile_menu.dart';
import 'package:vegytably_merchant/views/edit_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    MerchantController merchantController = Get.find<MerchantController>();
    // MerchantController merchantController = Get.find<MerchantController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 67,
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/ProfPic.png'),
              ),

              const SizedBox(
                height: 14,
              ),
              Obx(() {
                if (merchantController.isLoading.value) {
                  return const CircularProgressIndicator();
                }

                return Text(
                  merchantController.merchant.username,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff242424),
                    fontSize: 22,
                  ),
                );
              }),
              const SizedBox(
                height: 7,
              ),
              Obx(
                () => Text(
                  merchantController.merchant.phone,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff6482a6),
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 61,
              ),

              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const EditProfile(),
                          transition: Transition.rightToLeft);
                    },
                    child: const ProfileMenu(
                      "assets/images/editprofile.png",
                      "Edit Profile",
                      true,
                    ),
                  ),
                  const ProfileMenu(
                      "assets/images/notif.png", "Notifications", false),
                  GestureDetector(
                    onTap: () {
                      // Get.offAll(() => EditRestrictionPage(), transition: Transition.fade);
                    },
                    child: const ProfileMenu("assets/images/orderrecap.png",
                        "Order Recapitulation", false),
                  )
                  // Add more list tiles here
                ],
              ),
              // SizedBox(height: 70),
              Container(
                  padding: const EdgeInsets.only(top: 70),
                  child: GestureDetector(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text("Log Out"),
                          content:
                              const Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(() => const LoginPage(),
                                    transition: Transition.fade);
                                // AuthController.to.logout();
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                      );
                      // AuthController.to.logout();
                    },
                    child: const Text(
                      "Log Out",
                      style: TextStyle(
                        color: Color(0xFFD13D34),
                        fontSize: 15,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

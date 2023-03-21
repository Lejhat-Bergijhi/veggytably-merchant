import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/widgets/menu_list_item.dart';

import '../controllers/menu_controller.dart';
import 'addmenu_page.dart';

class MenuPage extends StatelessWidget {
  final MerchantMenuController menuController =
      Get.put(MerchantMenuController());

  MenuPage({super.key});

  TextStyle setTextStyle(bool selected) {
    if (selected) {
      return const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        decoration: TextDecoration.underline,
      );
    } else {
      return const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Daftar Menu',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextButton(
                      onPressed: () {
                        menuController.setView(true);
                      },
                      child: Obx(
                        () => Text(
                          'Ready Stock',
                          style:
                              setTextStyle(menuController.viewReadyStock.value),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextButton(
                    onPressed: () {
                      menuController.setView(false);
                    },
                    child: Obx(
                      () => Text(
                        'Out of Stock',
                        style:
                            setTextStyle(!menuController.viewReadyStock.value),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GetBuilder<MerchantMenuController>(
                    builder: (controller) {
                      if (menuController.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (menuController.menuList.isEmpty) {
                        return const Center(
                          child: Text('No data'),
                        );
                      }

                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        itemCount: controller.menuList.length,
                        itemBuilder: (BuildContext context, index) {
                          var menuItem = controller.menuList[index];
                          return MenuItem(
                            menu: menuItem,
                            inStock: controller.viewReadyStock.value,
                          );
                        },
                      );
                    },
                  ),
                  Positioned(
                    right: 24,
                    bottom: 32,
                    child: MaterialButton(
                      color: const Color(0xff70cb88),
                      onPressed: () {
                        Get.to(() => AddMenuPage(),
                            transition: Transition.fade);
                      },
                      shape: const CircleBorder(),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.add,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

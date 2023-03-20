import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/list_menu_page.dart';
import 'package:vegytably_merchant/widgets/menu_list_item.dart';

import '../controllers/menu_controller.dart';
import 'addmenu_page.dart';

class MenuPage extends StatelessWidget {
  final MerchantMenuController menuController =
      Get.put(MerchantMenuController());

  final int initialIndex;
  final List<Widget> pages = [
    const ListMenuReadyPage(),
    const Placeholder(),
  ];

  late final RxInt _selectedIndex = initialIndex.obs;

  MenuPage({super.key, this.initialIndex = 0});

  void setSelectedIndex(int index) {
    if (_selectedIndex.value != index) {
      _selectedIndex.value = index;
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
                      setSelectedIndex(0);
                    },
                    child: const Text(
                      'Ready Stock',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextButton(
                    onPressed: () {
                      setSelectedIndex(1);
                    },
                    child: const Text(
                      'Out of Stock',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(185, 103, 102, 102),
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
                      if (controller.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (controller.menuList.isEmpty) {
                        return const Center(
                          child: Text('No data'),
                        );
                      }

                      var menuList = controller.menuList;

                      return ListView.builder(
                        itemCount: menuList.length,
                        itemBuilder: (BuildContext context, index) {
                          var menuItem = menuList[index];
                          return MenuItem(
                            menu: menuItem,
                          );
                        },
                      );
                    },
                  ),
                  Positioned(
                    bottom: 20,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // add menu
                          Get.to(() => AddMenuPage(),
                              transition: Transition.fade);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff70cb88),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Add Menu +',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
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

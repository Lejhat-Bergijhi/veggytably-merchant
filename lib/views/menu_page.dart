import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/list_menu_page.dart';

import '../controllers/menu_controller.dart';

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
            // Body here
            Expanded(
              child: Obx(
                () => pages[_selectedIndex.value],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

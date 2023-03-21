import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/menu_controller.dart';
import '../models/menu_model.dart';
import '../views/editmenu_page.dart';

class MenuItem extends StatelessWidget {
  final Menu menu;
  final bool inStock;

  const MenuItem({
    super.key,
    required this.menu,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            menu.imageUrl != null
                ? GreyOverlay(
                    isGrey: !inStock,
                    child: Image.network(
                      menu.imageUrl!,
                      width: 100,
                      height: 100,
                      loadingBuilder: (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent? loadingProgress,
                      ) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return GreyOverlay(
                            isGrey: !inStock,
                            child: Image.asset("assets/image7.png"));
                      },
                    ),
                  )
                : GreyOverlay(
                    isGrey: !inStock,
                    child: Image.asset(
                      "assets/image7.png",
                      width: 100,
                    ),
                  ),
            Container(
                padding: const EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            menu.name,
                            style: const TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Rp ${menu.price}",
                            style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 5),
                          const Image(
                            image: AssetImage("assets/roasted.png"),
                            width: 200.0,
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => EditMenuPage(menu: menu),
                                  transition: Transition.fade);
                              // set selected menu
                              Get.find<MerchantMenuController>()
                                  .setSelectedMenu(menu);
                            },
                            child: const Text(
                              "Edit Menu",
                              style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(129, 57, 56, 56),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ]))),
          ],
        ),
      ),
    );
    //Divider();
  }
}

class GreyOverlay extends StatelessWidget {
  final Widget child;
  final bool isGrey;

  const GreyOverlay({
    required this.child,
    super.key,
    this.isGrey = true,
  });

  @override
  Widget build(BuildContext context) {
    return isGrey
        ? ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.saturation,
            ),
            child: child,
          )
        : child;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      //background color white
      backgroundColor: Colors.white,
      body: Center(
        child:
            //a simple rectangle
            Container(
          width: 350,
          height: 300,
          color: Colors.teal[300],
        ),
      ),

      //appbar invisible
      appBar: AppBar(
        //larger bar
        toolbarHeight: 80.0,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // do something
            },
            color: Colors.black,
          ),
          //spacing
          const SizedBox(width: 10.0),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: logout
              authController.logout();
            },
            color: Colors.black,
          ),
          const SizedBox(width: 10.0),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_dining_rounded),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Domvet',
          ),
        ],
        // currentIndex: _selectedIndex,
        // onTap: _onItemTapped,
        selectedItemColor: Colors.teal[300],
      ),

      //
    );
  }
}

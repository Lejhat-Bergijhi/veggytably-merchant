import 'package:flutter/material.dart';

int _selectedIndex = 2;

class ListMenuOutPage extends StatefulWidget {
  const ListMenuOutPage({super.key});

  @override
  State<ListMenuOutPage> createState() => _ListMenuOutPageState();
}

class _ListMenuOutPageState extends State<ListMenuOutPage> {
  String activeButton = 'Out of Stock';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
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
                    setState(() {
                      activeButton = 'Ready Stock';
                    }); // do something when the "Ready Stock" button is pressed
                  },
                  child: const Text(
                    'Ready Stock',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(185, 103, 102, 102),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      activeButton = 'Out of Stock';
                    }); // do something when the "Out of Stock" button is pressed
                  },
                  child: const Text(
                    'Out of Stock',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: <Widget>[
                const ListMenu(
                    gambar: "image9.png",
                    text: "Salad Yammy",
                    harga: "Rp 15.000",
                    syarat: "yammy.png",
                    edit: "Edit Menu"),
                const ListMenu(
                    gambar: "image7.png",
                    text: "Tomyum Guwrih",
                    harga: "Rp 35.000",
                    syarat: "tomyum.png",
                    edit: "Edit Menu"),
                const ListMenu(
                    gambar: "image6.png",
                    text: "Gado-gado Wuenak",
                    harga: "Rp 12.000",
                    syarat: "gado.png",
                    edit: "Edit Menu"),
                const ListMenu(
                    gambar: "image8.png",
                    text: "Roasted Chic",
                    harga: "Rp 60.000",
                    syarat: "roasted.png",
                    edit: "Edit Menu"),
              ],
            ),
          ),
          Container(
            width: 312,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                // do something when the "Sign up" button is pressed
              },
              child: const Text(
                'Add Menu+',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff70cb88),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xff70cb88),
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'home.png',
                  width: 30.0,
                  height: 30.0,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'menu.png',
                  width: 35.0,
                  height: 35.0,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'daftarmenu.png',
                  width: 35.0,
                  height: 35.0,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'profile.png',
                  width: 30.0,
                  height: 30.0,
                ),
                label: "",
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  final String gambar;
  final String text;
  final String harga;
  final String edit;
  final String syarat;

  const ListMenu({
    super.key,
    required this.gambar,
    required this.text,
    required this.harga,
    required this.syarat,
    required this.edit,
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
          // top: BorderSide(
          //   color: Colors.black12,
          //   width: 1.0,
          // ),
        ),
      ),
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 70, 71, 71), BlendMode.color),
              child: Image.asset("assets/$gambar"),
            ),
            Container(
                padding: const EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            text,
                            style: const TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            harga,
                            style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 5),
                          Image(
                            image: AssetImage(syarat),
                            width: 200.0,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            edit,
                            style: const TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(129, 57, 56, 56),
                              decoration: TextDecoration.underline,
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

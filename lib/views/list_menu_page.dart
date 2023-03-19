import 'package:flutter/material.dart';
import 'package:get/get.dart';

int _selectedIndex = 2;

class ListMenuReadyPage extends StatefulWidget{
  const ListMenuReadyPage({super.key});
  
  @override
  State <ListMenuReadyPage> createState() => _ListMenuReadyPageState();
}

class _ListMenuReadyPageState extends State<ListMenuReadyPage> {
  String activeButton = 'Ready Stock';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            Padding(
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
            SizedBox(height: 10),

            Row(
              children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0), 
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      activeButton = 'Ready Stock';
                    });// do something when the "Ready Stock" button is pressed
                  },
                  child: Text(
                    'Ready Stock',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0), 
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      activeButton = 'Out of Stock';
                    });// do something when the "Out of Stock" button is pressed
                  },
                  child: Text(
                    'Out of Stock',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(185, 103, 102, 102),
                    ),),
                ),
                ),
              ],
            ),
            SizedBox(height: 5),

            Expanded(
              child: ListView(
                children: <Widget>[
                  new ListMenu(gambar: "image9.png", text: "Salad Yammy", harga: "Rp 15.000", syarat: "yammy.png", edit: "Edit Menu"),
                  new ListMenu(gambar: "image7.png", text: "Tomyum Guwrih", harga: "Rp 35.000", syarat: "tomyum.png",edit: "Edit Menu"),
                  new ListMenu(gambar: "image6.png", text: "Gado-gado Wuenak", harga: "Rp 12.000", syarat: "gado.png", edit: "Edit Menu"),
                  new ListMenu(gambar: "image8.png", text: "Roasted Chic", harga: "Rp 60.000", syarat: "roasted.png", edit: "Edit Menu"),
                  new ListMenu(gambar: "image9.png", text: "Salad Yammy", harga: "Rp 15.000", syarat: "yammy.png", edit: "Edit Menu"),
                  new ListMenu(gambar: "image6.png", text: "Salad Juowo", harga: "Rp 9.000", syarat: "juowo.png", edit: "Edit Menu")
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
                child: Text(
                  'Add Menu+',
                  style: TextStyle(
                    fontSize: 14,
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
            SizedBox(height: 15),

            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Color(0xff70cb88),
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
          ]
        ),
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

  const ListMenu({required this.gambar, required this.text, required this.harga, required this.syarat, required this.edit});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
          // top: BorderSide(
          //   color: Colors.black12,
          //   width: 1.0,
          // ),
        ),),
      padding: new EdgeInsets.only(left: 15),
      child: new Align(
        alignment: Alignment.topLeft,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Image(
              image: AssetImage(gambar), width: 100.0,
            ),
            new Container(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.topLeft,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      harga,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Image(
                      image: AssetImage(syarat), 
                      width: 200.0,
                    ),
                    SizedBox(height: 8),
                    Text(
                      edit,
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(129, 57, 56, 56),
                        decoration: TextDecoration.underline,),
                    ),
                  ]
                )
              )
            ),
          ],
        ),
      ),
    );
    //Divider();
  }
}

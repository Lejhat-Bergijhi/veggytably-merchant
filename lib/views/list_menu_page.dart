import 'package:flutter/material.dart';

class ListMenuReadyPage extends StatefulWidget {
  const ListMenuReadyPage({super.key});

  @override
  State<ListMenuReadyPage> createState() => _ListMenuReadyPageState();
}

class _ListMenuReadyPageState extends State<ListMenuReadyPage> {
  String activeButton = 'Ready Stock';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListMenu(
            gambar: "image9.png",
            text: "Salad Yammy",
            harga: "Rp 15.000",
            syarat: "yammy.png",
            edit: "Edit Menu"),
        ListMenu(
            gambar: "image7.png",
            text: "Tomyum Guwrih",
            harga: "Rp 35.000",
            syarat: "tomyum.png",
            edit: "Edit Menu"),
        ListMenu(
            gambar: "image6.png",
            text: "Gado-gado Wuenak",
            harga: "Rp 12.000",
            syarat: "gado.png",
            edit: "Edit Menu"),
        ListMenu(
            gambar: "image8.png",
            text: "Roasted Chic",
            harga: "Rp 60.000",
            syarat: "roasted.png",
            edit: "Edit Menu"),
        ListMenu(
            gambar: "image9.png",
            text: "Salad Yammy",
            harga: "Rp 15.000",
            syarat: "yammy.png",
            edit: "Edit Menu"),
        ListMenu(
            gambar: "image6.png",
            text: "Salad Juowo",
            harga: "Rp 9.000",
            syarat: "juowo.png",
            edit: "Edit Menu")
      ],
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
            Image(
              image: AssetImage("assets/$gambar"),
              width: 100.0,
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
                            image: AssetImage("assets/$syarat"),
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

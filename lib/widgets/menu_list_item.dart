import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final double price;
  // final String? restriction;

  const MenuItem({
    super.key,
    this.imageUrl,
    required this.name,
    required this.price,
    // required this.restriction,
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
            imageUrl != null
                ? Image.network(
                    imageUrl!,
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
                      return Image.asset("assets/image7.png");
                    },
                  )
                : Image.asset(
                    "assets/image7.png",
                    width: 100,
                  ),
            Container(
                padding: const EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Rp $price",
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
                          const Text(
                            "Edit Menu",
                            style: TextStyle(
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/widgets/restriction_page_type.dart';
import 'package:vegytably_merchant/widgets/order_list_item.dart';

class PesananPage extends StatefulWidget {
  @override
  _PesananPageState createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          shadowColor: const Color.fromARGB(25, 78, 54, 54),
          toolbarHeight: 70,
          leading: IconButton(
            icon: Image.asset('assets/images/arrow-left.png'),
            color: Color(0x5F5F5F),
            onPressed: () {
              Get.back();
            },
            iconSize: 40,
          ),
          titleSpacing: 0,
          title: Text(
            "Detail Pesanan",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: "Rubik",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CUSTOMER',
                  style: TextStyle(
                    color: Color.fromARGB(255, 159, 159, 159),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7FB),
                  border: Border.all(color: Color(0xF6F7FB)),
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
            ),
            Container(
              width: 312,
              height: 50,
              padding: const EdgeInsets.only(
                  left: 10, right: 25, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text(
                        'Pony',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '#425345 | 12 Des, 22:10',
                        style: TextStyle(
                          color: Color.fromARGB(255, 159, 159, 159),
                          fontSize: 12,
                          fontFamily: "Rubik",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 82),
                  Icon(
                    Icons.message,
                    color: Color.fromARGB(222, 112, 203, 136),
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.phone,
                    color: Color.fromARGB(222, 112, 203, 136),
                    size: 24,
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF6F7FB),
                borderRadius: BorderRadius.circular(7.0),
              ),
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
            ),
            SizedBox(
              height: 7,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'DIETARY RESTRICTION TYPE',
                  style: TextStyle(
                    color: Color.fromARGB(255, 159, 159, 159),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 25, top: 5), // Adjust the left padding as needed
              child: Row(
                children: [
                  RestrictionType("MEAT-FREE"),
                  RestrictionType("FISH-FREE"),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ORDERS',
                  style: TextStyle(
                    color: Color.fromARGB(255, 159, 159, 159),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView(
                padding:
                    EdgeInsets.only(right: 15, left: 15, bottom: 5, top: 5),
                children: [
                  OrderListItem('1x', 'Sego Tiwul', 'Rp3.000'),
                  Divider(),
                  OrderListItem('2x', 'Nasi Liwet', 'Rp10.000'),
                  Divider(),
                  OrderListItem('1x', 'Jeruk Anget', 'Rp3.000'),
                  Divider(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PAYMENT SUMMARY',
                  style: TextStyle(
                    color: Color.fromARGB(255, 159, 159, 159),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment:
                        CrossAxisAlignment.start,
                children: [
                  Row( 
                    children: [
                      
                      Text(
                        'Total Order',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(width: 184,),
                      Text(
                        'Rp 26.000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  SizedBox(height: 7,),
                  Row( 
                    children: [
                      
                      Text(
                        'Delivery Fee',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(width: 176,),
                      Text(
                        'Rp 10.000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ],
              ),
              margin: EdgeInsets.all(15),
            ),

            SizedBox(
              height: 7,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'DRIVER',
                  style: TextStyle(
                    color: Color.fromARGB(255, 159, 159, 159),
                    fontSize: 10,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7FB),
                  border: Border.all(color: Color(0xF6F7FB)),
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
            ),
            Container(
              width: 312,
              height: 50,
              padding: const EdgeInsets.only(
                  left: 10, right: 25, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.message,
                    color: Color.fromARGB(222, 112, 203, 136),
                    size: 24,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text(
                        'Panda Nampai',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Sampai sebentar lagi',
                        style: TextStyle(
                          color: Color.fromARGB(255, 159, 159, 159),
                          fontSize: 12,
                          fontFamily: "Rubik",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 100),
                  Icon(
                    Icons.phone,
                    color: Color.fromARGB(222, 112, 203, 136),
                    size: 24,
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF6F7FB),
                borderRadius: BorderRadius.circular(7.0),
              ),
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7FB),
                  border: Border.all(color: Color(0xF6F7FB)),
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
            ),
            Container(
              width: 312,
              height: 60,
              padding: const EdgeInsets.only(
                  left: 10, right: 122, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/Group342.png"),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text(
                        'Driver belum mengisi PIN',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '5739',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF6F7FB),
                borderRadius: BorderRadius.circular(7.0),
              ),
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7FB),
                  border: Border.all(color: Color(0xF6F7FB)),
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
            SizedBox(height: 70),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              width: 312,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  // Get.offAll(() => const ProfilePage(),
                  //     transition: Transition.fade);
                  Get.back();
                },
                child: const Text(
                  'Pesanan Siap',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff70cb88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}

import 'package:flutter/material.dart';

// import '../api/merchant_api.dart';
// import '../controllers/auth_controller.dart';
// import '../models/merchant_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Future<MerchantProfile> _merchantProfile;

  @override
  void initState() {
    super.initState();
    // _merchantProfile = MerchantApi.fetchMerchantProfile();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // AuthController.checkAuth();
    // });
  }

  @override
  Widget build(BuildContext context) {
    double marginleft = 24;
    double boxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffcfffe),
      body: Stack(
        children: [
          Container(
            height: 188,
            width: boxWidth,
            child: Image.asset('assets/images/backgroundhome.png',
                fit: BoxFit.cover),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: marginleft),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 149,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x0c000000),
                          blurRadius: 12,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    // height: 85,
                    padding: EdgeInsets.symmetric(horizontal: 23, vertical: 14),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 35,
                            child: Image.asset('assets/images/merchantlogo.png',
                                fit: BoxFit.fitWidth),
                          ),
                          SizedBox(width: 12),
                          Container(
                            width: boxWidth - 2 * (23 + 24) - 35 - 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Padang Vegan, Solo",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontFamily: "Rubik",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Jl Wonorejo I/25 A, Jawa Timur, Surabaya",
                                  style: TextStyle(
                                    color: Color(0xff9f9f9f),
                                    fontSize: 12,
                                    fontFamily: "Rubik",
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "+62 89101112131",
                                  style: TextStyle(
                                    color: Color(0xff9f9f9f),
                                    fontSize: 12,
                                    fontFamily: "Rubik",
                                  ),
                                ),
                              ],
                            ),
                          )
                        ])),
                SizedBox(
                  height: 12,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x0c000000),
                          blurRadius: 12,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 23, vertical: 21),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 35,
                            child: Image.asset('assets/images/domveticon.png',
                                fit: BoxFit.fitWidth),
                          ),
                          SizedBox(width: 12),
                          Container(
                              width: boxWidth - 2 * (23 + 24) - 35 - 12,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "SALDO DOMVET",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Rp 1.234.245,00",
                                      style: TextStyle(
                                        color: Color(0xffd2b150),
                                        fontSize: 22,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ])),
                        ])),
                SizedBox(
                  height: 23,
                ),
                Text(
                  "REKAP HARI INI",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 12,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 80,
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 12, top: 7, left: 6, right: 6),
                      width: (boxWidth - 2 * marginleft - 12) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.66),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0c000000),
                            blurRadius: 16,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        Text(
                          "Pesanan Selesai",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.5),
                          height: 1,
                          color: Color(0xffD1D1D6),
                        ),
                        Spacer(),
                        Text(
                          "17",
                          style: TextStyle(
                            color: Color(0xff6ec885),
                            fontSize: 24,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 12, top: 7, left: 6, right: 6),
                      width: (boxWidth - 2 * marginleft - 12) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.66),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0c000000),
                            blurRadius: 16,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        Text(
                          "Profit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.5),
                          height: 1,
                          color: Color(0xffD1D1D6),
                        ),
                        Spacer(),
                        Text(
                          "200.000",
                          style: TextStyle(
                            color: Color(0xff6ec885),
                            fontSize: 24,
                          ),
                        ),
                      ]),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

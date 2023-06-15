import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/controllers/auth_controller.dart';
import 'package:vegytably_merchant/controllers/merchant_controller.dart';

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
      backgroundColor: const Color(0xfffcfffe),
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
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 149,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0c000000),
                          blurRadius: 12,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    // height: 85,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 14),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 35,
                            child: Image.asset('assets/images/merchantlogo.png',
                                fit: BoxFit.fitWidth),
                          ),
                          const SizedBox(width: 12),
                          Obx(() => SizedBox(
                                width: boxWidth - 2 * (23 + 24) - 35 - 12,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      MerchantController
                                          .to.merchant.restaurantName,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      MerchantController
                                          .to.merchant.restaurantAddress,
                                      style: const TextStyle(
                                        color: Color(0xff9f9f9f),
                                        fontSize: 12,
                                        fontFamily: "Rubik",
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      AuthController.to.user.phone,
                                      style: const TextStyle(
                                        color: Color(0xff9f9f9f),
                                        fontSize: 12,
                                        fontFamily: "Rubik",
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ])),
                const SizedBox(
                  height: 12,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0c000000),
                          blurRadius: 12,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 21),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 35,
                            child: Image.asset('assets/images/domveticon.png',
                                fit: BoxFit.fitWidth),
                          ),
                          const SizedBox(width: 12),
                          Container(
                              width: boxWidth - 2 * (23 + 24) - 35 - 12,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "SALDO DOMVET",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Rp ${AuthController.to.user.wallet}",
                                      style: const TextStyle(
                                        color: Color(0xffd2b150),
                                        fontSize: 22,
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ])),
                        ])),
                const SizedBox(
                  height: 23,
                ),
                const Text(
                  "REKAP HARI INI",
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 12,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 80,
                  child: Row(children: [
                    Container(
                      padding: const EdgeInsets.only(
                          bottom: 12, top: 7, left: 6, right: 6),
                      width: (boxWidth - 2 * marginleft - 12) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.66),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0c000000),
                            blurRadius: 16,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        const Text(
                          "Pesanan Selesai",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
                          height: 1,
                          color: const Color(0xffD1D1D6),
                        ),
                        const Spacer(),
                        const Text(
                          "17",
                          style: TextStyle(
                            color: Color(0xff6ec885),
                            fontSize: 24,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          bottom: 12, top: 7, left: 6, right: 6),
                      width: (boxWidth - 2 * marginleft - 12) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.66),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0c000000),
                            blurRadius: 16,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        const Text(
                          "Profit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7.5),
                          height: 1,
                          color: const Color(0xffD1D1D6),
                        ),
                        const Spacer(),
                        const Text(
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

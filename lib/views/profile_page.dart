import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column( //
        children: [
          Container(
            padding: const EdgeInsets.only(top: 17.0, left: 17.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    
                  },
                ),
                const SizedBox(width: 7.0),
                Container(
                  child: const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 205,
            padding: const EdgeInsets.only(left:78, right: 78),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: Colors.black,
                    Icons.account_circle_rounded,
                    size: 70,
                  ),
                  const SizedBox(height: 12,),
                  Container(
                    child: Text(
                      "Nandarelle Aurora Trevor",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Container(
                    child: Text(
                      "+62 89101112131",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w400,
                      ),
                    )
                  ),
                ]
              ),
            )
          ),
          const SizedBox(height: 20.0),
          Container(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                      top: BorderSide(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top:10, bottom:10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.black12,
                        size: 40,
                      ),
                      const SizedBox(width: 17.0),
                      Container(
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(), 
                      Container(
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: Color(0xFF5F5F5F)
                        ),
                      )
                    ],
                  ),
                ),
                Container(
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
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top:10, bottom:10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.black12,
                        size: 40,
                      ),
                      const SizedBox(width: 17.0),
                      Container(
                        child: const Text(
                          "Notification",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(), 
                      Container(
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: Color(0xFF5F5F5F)
                        ),
                      )
                    ],
                  ),
                ),
                Container(
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
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top:10, bottom:10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.analytics,
                        color: Colors.black12,
                        size: 40,
                      ),
                      const SizedBox(width: 17.0),
                      Container(
                        child: const Text(
                          "Order’s Recapitulation",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(), 
                      Container(
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: Color(0xFF5F5F5F)
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(bottom:50),
            child: Text(
              "Log Out",
              style: TextStyle(
                color: Color(0xFFD13D34),
                fontSize: 15,
                fontFamily: "Rubik",
                fontWeight: FontWeight.w400,
              ),
            )
          ),

        ],
      )
    );
  }
}
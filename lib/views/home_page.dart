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
        body: Container(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 33.0),
            child: SingleChildScrollView(
                
                scrollDirection: Axis.vertical,
                
                child: Column(
                    //center
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    

                    children: [
                        // text
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                child: Text(
                                    "Padang Vegan",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 27,
                                        // font Rubik medium
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),
                        ),
                        
                        const SizedBox(height: 17.0),
                        Container(
                            //position left
                            
                        
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(                                           
                                    bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16),
                                    topRight: Radius.circular(16), topLeft: Radius.circular(16)
                                    
                                ),
                               
                                boxShadow: [                                                               
                                BoxShadow(color: Color(0x40000000), spreadRadius: 0, blurRadius: 8, offset: Offset(0, 2))
                                
                                ],
                                color: Colors.white,
                            ),
                            width: 312,
                            height: 138,
                            child: Column(
                                children:[
                                    Row(
                                        children: [
                                            Container(
                                                //margin 24 24 36 41
                                                margin: const EdgeInsets.only(left: 17.0, top: 11.0),
                                                child: Text(
                                                    "Today’s Recapitulation",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        // font Rubik medium
                                                        fontFamily: "Rubik",
                                                        fontWeight: FontWeight.w500 ,
                                                    ),
                                                ),
                                            ),
                                            //spacing
                                            const SizedBox(width: 10),
                                            Container(
                                                margin: const EdgeInsets.only(top: 15.0),
                                                child: Text(
                                                    "Lihat Riwayat",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                        // font Rubik medium
                                                        fontFamily: "Rubik",
                                                        //underline
                                                        decoration: TextDecoration.underline,
                                                        fontWeight: FontWeight.w300 ,
                                                    ),
                                                ),
                                            ),
                                        ]
                                    ),
                                    //spacing
                                    const SizedBox(height: 7),
                                    Container(
                                        decoration:  BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                   
                                                    Color(0xFF9F9F9F),
                                                    Color(0xFF9F9F9F),
                                                    Color(0xFFD1D1D6),
                                                    
                                                ],  
                                            ),
                                        ),
                                        height: 1,
                                    ),
                                    const SizedBox(height: 15),
                                    Center(
                                        child: Row(
                                            children: [
                                                const SizedBox(width: 40),
                                                Container(
                                                    child: Center(
                                                        child: Column(
                                                            children:
                                                            [
                                                                Text(
                                                                    "Done",
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 17,
                                                                        // font Rubik medium
                                                                        fontFamily: "Rubik",
                                                                        fontWeight: FontWeight.w400 ,
                                                                    ),
                                                                ),
                                                                const SizedBox(height: 5),
                                                                Text(
                                                                    "17",
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 36,
                                                                        // font Rubik medium
                                                                        fontFamily: "Rubik",
                                                                        fontWeight: FontWeight.w400 ,
                                                                    ),
                                                                ),
                                                            ]
                                                        )
                                                    )
                            
                                                ),
                                                const SizedBox(width: 57),
                                                Container(
                                                    child: Center(
                                                        child: Column(
                                                            children:
                                                            [
                                                                Text(
                                                                    "Profit",
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 17,
                                                                        // font Rubik medium
                                                                        fontFamily: "Rubik",
                                                                        fontWeight: FontWeight.w400 ,
                                                                    ),
                                                                ),
                                                                const SizedBox(height: 5),
                                                                Text(
                                                                    "200.000",
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 36,
                                                                        // font Rubik medium
                                                                        fontFamily: "Rubik",
                                                                        fontWeight: FontWeight.w400 ,
                                                                    ),
                                                                ),
                                                            ]
                                                        )
                                                    )
                            
                                                ),
                                                const SizedBox(width: 28),
                                            ]

                                        ),
                                    )
                                ]
                            )
                            
                        ),  
                    //padding
                        const SizedBox(height: 20.0),
                        Container(
                            
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(                                           
                                    bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16),
                                    topRight: Radius.circular(16), topLeft: Radius.circular(16)
                                    
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                        Color(0xFFF8D879),
                                        Color(0xFFFFEAAD),
                                    ],  
                                ),
                                boxShadow: [                                                               
                                BoxShadow(color: Color(0x40000000), spreadRadius: 0, blurRadius: 8, offset: Offset(0, 2))     
                                ],
                                //color from rgba

                                
                                
                                color: Color(0xffb74093),
                            ),
                            width: 312,
                            height: 138,
                            // margin: const EdgeInsets.only(left: 17.0, right: 25.0),
                            child: Column(
                                
                                children:[
                                    Row(
                                        children: [
                                            const SizedBox(width: 17),
                                            Container(
                                                child: Column(
                                                    children:
                                                    [
                                                         const SizedBox(height: 10),
                                                        Icon(
                                                            Icons.wallet,
                                                            color: Colors.black,
                                                            size: 20.0,
                                                        )
                                                    ]
                                                )
                                            ),
                                            //spacing
                                            const SizedBox(width: 8),
                                            Container(
                                                margin: const EdgeInsets.only(top: 11.0),
                                                child: Text(
                                                    "Domvet",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17,
                                                        // font Rubik medium
                                                        fontFamily: "Rubik",
                                                        fontWeight: FontWeight.w500 ,
                                                    ),
                                                ),
                                            ),
                                        ]
                                    ),
                                    //spacing
                                    const SizedBox(height: 7),
                                    Container(
                                        decoration:  BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                   
                                                    Color(0xFFD2B150),
                                                    Color(0xFFD2B150),
                                                    // Color(0xFF9F9F9F),
                                                    // Color(0xFFD1D1D6),
                                                    
                                                ],  
                                            ),
                                        ),
                                        height: 1,
                                    ),
                                    const SizedBox(height: 9.5),
                                    Row(
                                        
                                        children:[
                                            const SizedBox(width: 17),
                                            Text(
                                                "Saldo Anda:",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    // font Rubik medium
                                                    fontFamily: "Rubik",
                                                    fontWeight: FontWeight.w400 ,
                                            
                                                ),
                                                textAlign: TextAlign.left,
                                            ),
                                        ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                        
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                            const SizedBox(width: 17),
                                            Text(
                                                "1.234.245,00",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 36,
                                                    // font Rubik medium
                                                    fontFamily: "Rubik",
                                                    fontWeight: FontWeight.w400 ,
                                            
                                                ),
                                            ),
                                            Spacer(),
                                            Container(
                                                child: Icon(
                                                    Icons.visibility,
                                                    color: Colors.black,
                                                    size: 29.0,
                                                ),
                                            ),
                                            const SizedBox(width: 25),
                                        ],
                                    ),
                                ],
                            )
                        ),  
                    ],
                ),
            ),
        ),

      
        appBar: AppBar(
            
            //flexible space
            flexibleSpace: Container(
                //position left
     
                 decoration: const BoxDecoration(
                     borderRadius: BorderRadius.only(                                           
                        bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                            Color(0xFF60B874),
                            Color(0xFF7BD896),
                            
                        ],  
                    ),

                ),
            ),
            //remove right padding
            //set margin of appbar
            titleSpacing: 0,   
            //make container the size of appbar

            title: Container(
                //margin 24 24 36 41
                margin: const EdgeInsets.only(left: 24.0, right: 10.0, top: 41.0, bottom: 36.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                         Column(
                            //align left
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //spacing
                            mainAxisSize: MainAxisSize.min,
                            //spacing
                            mainAxisAlignment: MainAxisAlignment.start,
                            //spacing
                            verticalDirection: VerticalDirection.down,
                            //spacing
                            textBaseline: TextBaseline.alphabetic,
                            children:[
                                Text(
                                    "Nandarelle Aurora Trevor",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        // font Rubik medium
                                        fontFamily: "Rubik",
                                        fontWeight: FontWeight.bold,

                                    ),
                                ),
                                const SizedBox(height: 5.83),
                                Text(
                                    "+62 89101112131",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: "Rubik",
                                    ),
                                ),
                            ],
                        ),
                        //spacing
                        
                        Container(
                            child: IconButton(

                                iconSize: 45.0,
                                icon: const Icon(Icons.account_circle),
                                onPressed: () {
                                    // do something
                                },
                                color: Colors.black,
                            ),
                        )
                    ]
                )
                
            ),
            
            
            //color transparent
            backgroundColor: Colors.transparent,
            toolbarHeight: 115.0,
            elevation: 0,
            actions: <Widget>[
                
                
                
                //spacing
                const SizedBox(width: 0),

            ],
        ),


        
        bottomNavigationBar: Container(   
            height: 82.7,                                          
            decoration: BoxDecoration(                                                   
                borderRadius: BorderRadius.only(                                           
                topRight: Radius.circular(16), topLeft: Radius.circular(16)),            
                boxShadow: [                                                               
                BoxShadow(color: Color.fromRGBO(0,0,0,230), spreadRadius: 0, blurRadius: 20),       
                ],

            ),                                                                         
            child: ClipRRect(                                                            
                borderRadius: BorderRadius.only(                                           
                    topLeft: Radius.circular(16.0),                                            
                    topRight: Radius.circular(16.0),                                           
                ),                                                                         
                child: BottomNavigationBar(
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
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.black38,
                ),                                                                     
            )                                                                           
        )
    
        );
    }
 
}

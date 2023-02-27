import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background color white 
        backgroundColor: Colors.white,
        body: Center(
            child:
            //a simple rectangle
            Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                            Color(0xFF7BD896),
                            Color(0xFF60B874)
                        ],                                                                         
                    ),  
                )

            ),

        ),

        appBar: AppBar(
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                     borderRadius: BorderRadius.only(                                           
                        bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                            Color(0xFF7BD896),
                            Color(0xFF60B874)
                        ],  
                    ),
                ),
            ),
            toolbarHeight: 115.0,
            elevation: 0,
            actions: <Widget>[
                
                
                IconButton(
                    //profile icon

                    //make icon larger
                    iconSize: 45.0,
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {
                        // do something
                    },
                    color: Colors.black,
                ),
                //spacing
                const SizedBox(width: 20.0),

            ],
        ),


        // appBar: Container(
        //     height: 80,
        //     decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //             colors: [
        //                 Color(0xFF7BD896),
        //                 Color(0xFF60B874)
        //             ],                                                                         
        //         ),  
        //     ),
        //     child: Row(
        //         children: [
        //             IconButton(
        //                 icon: Icon(Icons.account_circle),
        //                 onPressed: () {
        //                     // do something
        //                 },
        //                 color: Colors.black,
        //             ),
        //             Text("Hello World"),
        //         ],
        //     ),
        // ),
        // //appbar invisible
        // appBar: AppBar(
        //     //larger bar
        //     toolbarHeight: 80.0,
        //     elevation: 0,
        //      actions: <Widget>[
                
                
        //         IconButton(
        //             //profile icon


        //             icon: const Icon(Icons.account_circle),
        //             onPressed: () {
        //                 // do something
        //             },
        //             color: Colors.black,
        //         ),
        //         //spacing
        //         const SizedBox(width: 10.0),

        //     ],
        // ),
        bottomNavigationBar: Container(                                             
            decoration: BoxDecoration(                                                   
                borderRadius: BorderRadius.only(                                           
                topRight: Radius.circular(16), topLeft: Radius.circular(16)),            
                boxShadow: [                                                               
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 20),       
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
                    selectedItemColor: Colors.teal[300],
                ),                                                                     
            )                                                                           
        )
    
        //
    );
  }
 
}
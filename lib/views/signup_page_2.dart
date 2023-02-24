import 'package:flutter/material.dart';

class SignUpPageCont extends StatelessWidget {
  const SignUpPageCont({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),


              // Text: VegyMerch
              Text('Welcome!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
              SizedBox(height: 10),

              // Text: Powered by Vegytably
              Text('Manage your Bussiness Anywhere and Everywhere.',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                )
              ),
               SizedBox(height: 40),

              Text('Merchant’s Data',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                )
              ),
               SizedBox(height: 20),

              //Input nama
              Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Merchant Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //input no telp
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Telephone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Login button
                Container(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),

                // Text: Don't have an account?
                Text('Already have an account?',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),

                // Text: Sign Up
                Text('Login',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
          ]),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),

              // logo
              Icon(Icons.lock, 
              size:100,
            ),
              SizedBox(height: 50),

              // Text: VegyMerch
              Text('VegyMerch',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
              SizedBox(height: 10),

              // Text: Powered by Vegytably
              Text('Powered by Vegytably',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                )
              ),
               SizedBox(height: 20),

               // Input Email or Telephone Number
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email or Telephone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Input Password
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                    child: Text('Login'),
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
                Text('Don\'t have an account?',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),

                // Text: Sign Up
                Text('Sign Up',
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
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:search_navbar/components/button.dart';
import 'package:search_navbar/components/fields.dart';
import 'package:search_navbar/components/square_tile.dart';
import 'package:search_navbar/pages/home_page.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final usernameController = TextEditingController();
  bool login = true;

  final passwordController = TextEditingController();

  //sign user in
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  //logo

                  // Icon(Icons.lock, size: 100)
                  Icon(
                    !login ? Icons.lock : Icons.lock_open,
                    size: 100,
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //welcome back, text

                  Text('Welcome back James!'),
                  SizedBox(
                    height: 25,
                  ),

                  //username

                  MyTextFields(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //password

                  MyTextFields(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //forgot password?

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //sign in button
                  MyButton(
                    onTap: () {
                      setState(() {
                        login = !login;
                      });
                      Future.delayed(Duration(milliseconds: 1000), () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(),));
                      });
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  //or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //google+apple sign in
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MySquareTile(
                          imagePath:
                              'lib/images/apple-logo-png-dallas-shootings-don-add-are-speech-zones-used-4.png'),
                      SizedBox(
                        width: 10,
                      ),
                      MySquareTile(
                          imagePath: 'lib/images/Google__G__Logo.svg.webp')
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //register now

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Registre now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

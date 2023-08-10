// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/components/button.dart';
import 'package:social_app/components/fields.dart';
import 'package:social_app/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  //register function
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();
  bool login = true;
  bool isLoading = false;

  final passwordController = TextEditingController();

  //sign user in method

  void signUserIn() async {
      print('this is sign user in function');


    //show loading circle
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },); 

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      //Wrong email
      showErrorMessage(e.code);
      // if (e.code == 'user-not-found'){
      //   //show error to user
      //   wrongEmailMessage();
      // } 
      // //Wrong password
      // else if (e.code == 'wrong-password') {
      //   //show error to user
      //   wrongPasswordMessage();
      // }
    }
  }

  void showErrorMessage (String message) {
    print('this is log in loading');
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.purple,
        title: Center(child: Text(message,
        style: TextStyle(color: Colors.white),)),);
    });
  }
  

  // void wrongPasswordMessage () {
  //   showDialog(context: context, builder: (context) {
  //     return  AlertDialog(title: Text('Incorrect Password'),);
  //   });
  // }

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
                    Icons.lock,
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
                    controller: emailController,
                    hintText: 'Email',
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
                      signUserIn();
                      // setState(() {
                      //   isLoading = !isLoading;
                      // });
                      // Future.delayed(Duration(milliseconds: 1000), () {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => HomePage(),));
                      // });
                      // if(context.mounted) Navigator.pop(context);
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    text: 'Sign In' ,
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
                    height: 30,
                  ),

                  //register now

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?'),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Register now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
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
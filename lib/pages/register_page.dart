// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/fields.dart';
import '../components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});
  

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  
  bool login = true;
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign user up method
  void signUserUp() async {
    print('this is sign user Up function');
    showDialog(context: context, builder: (context) {
      return Center(child: CircularProgressIndicator());
    },);

    try {
      if(passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text,
          );
      } else {
        showErrorMessage('Password dont match');
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
    }
  }

  void showErrorMessage (String message) {
    print('this is sign user Up loading');
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.purple,
        title: Center(child: Text(message,
        style: TextStyle(color: Colors.white),)),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                // physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 50,
                    // ),
            
                    //logo
            
                    // Icon(Icons.lock, size: 100)
                    Icon(
                      Icons.lock,
                      size: 50,
                    ),
                    SizedBox(
                      height: 50,
                    ),
            
                    //welcome back, text
            
                    Text('Lets create an account for you!'),
                    SizedBox(
                      height: 25,
                    ),
            
                    //username
            
                    MyTextFields(
                      controller: emailController,
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
                      height: 20,
                    ),
            
                    //forgot password?
                    MyTextFields(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //confirm password field
            
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Text(
                    //         'Forgot password?',
                    //         style: TextStyle(color: Colors.grey[600]),
                    //       ),
                    //     ],
                    //   ),
                    // ),
            
                    SizedBox(
                      height: 25,
                    ),
            
                    //sign in button
                    MyButton(
                      onTap: signUserUp,
                      text: 'Sign Up'
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
                      height: 50,
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
                        Text('Already have an account?'),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Login now',
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
          ),
        ));
  }
}
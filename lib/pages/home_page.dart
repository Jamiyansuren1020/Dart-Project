// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(actions: [Icon(Icons.logout,)],),
      appBar: AppBar(actions: [IconButton(onPressed: () {
        setState() {
          
        }
         Navigator.of(context).pop(HomePage());}, icon: Icon(Icons.logout))]),
      body: Center(child: Text('Welcome to home page')),
    );
  }
}
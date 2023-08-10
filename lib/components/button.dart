// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;
  final String text;
  const MyButton({super.key,
  required this.onTap,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Center(
            child: Text(text,
            style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            ),
            ),
          ),
        
        ),
    )
    ;
  }
}
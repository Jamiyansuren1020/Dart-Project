import 'package:flutter/material.dart';

class MyTextFields extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<MyTextFields> createState() => _MyTextFieldsState();
}

class _MyTextFieldsState extends State<MyTextFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
            suffixIcon: IconButton(icon: Icon(widget.controller.text.length > 0 ?Icons.clear : null), onPressed: () {
              widget.controller.clear();
            },),
            
            // controller.text.length > 0 
            //     ? IconButton(
            //         onPressed: () {
            //           controller.clear();
            //         },
            //         icon: const Icon(Icons.clear))
            //     : null
                ),
      ),
    );
  }
}

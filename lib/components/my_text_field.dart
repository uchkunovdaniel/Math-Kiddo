import "package:flutter/material.dart";
import 'package:mathkiddo/pages/theme.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller ;
  final String hintText;
  final bool obscureText;
  const MyTextField ({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    });

  @override 
  Widget build (BuildContext context){
    return  Padding(
          padding : const EdgeInsets.symmetric(horizontal: 25.0),
         child: TextField(
          controller : controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appBarColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: levelColors[3]),
            ),
            fillColor: levelColors[2],
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),
        ),
        );
  }
}

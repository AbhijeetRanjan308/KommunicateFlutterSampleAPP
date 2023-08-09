import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormCustom extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData iconData;
  bool isObscured;

  TextFormCustom({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.iconData,
    this.isObscured = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextField(
        obscureText: isObscured,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            iconData,
            color: Colors.indigoAccent,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1.0, color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(width: 1.0, color: Colors.white)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTxtFormField extends StatelessWidget {
  String hintText;
  bool obscureText;
  TextEditingController controller;
  CustomTxtFormField({
    Key? key, 
    required this.hintText,
    required this.obscureText,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextFormField(
        controller: controller,
        autocorrect: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.lato(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffBDB8B8)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

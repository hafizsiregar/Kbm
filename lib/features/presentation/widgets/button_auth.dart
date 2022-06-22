import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAuth extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color background;
  final Color textColor;
  final Color sideColor;

  const ButtonAuth(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.background,
      required this.textColor,
      required this.sideColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.lato(
            fontSize: 14, fontWeight: FontWeight.bold, color: textColor),
      ),
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: sideColor,
            width: 1,
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(background),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        fixedSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 36)),
        minimumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 36)),
      ),
    );
  }
}

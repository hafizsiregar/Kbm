import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonGoogle extends StatelessWidget {

  String img;
  String txtSpan1;
  String txtSpan2;

  ButtonGoogle({Key? key, 
    required this.img, 
    required this.txtSpan1, 
    required this.txtSpan2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(500),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
          img,
          height: 30,
          width: 30,
          fit: BoxFit.cover,),
          const SizedBox(width: 25),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: txtSpan1,style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.black
                )),
                TextSpan(text: txtSpan2,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
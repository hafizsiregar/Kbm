import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/source/assets.dart';
import '../../../../core/utils/styles/colors.dart';

class DetailChat extends StatefulWidget {
  static const routeName = 'detailChat';
  const DetailChat({ Key? key }) : super(key: key);

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {

  final _formController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: BaseColor.kWhiteColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 15),
              Image.asset(BaseImages.circleKlinik1,
              height: 40,
              width: 40),
              const SizedBox(width: 30),
              Text('Klinik Nusa Indah',
                style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),
      );
    }

    Widget textForm() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: TextFormField(
          controller: _formController,
          decoration: InputDecoration(
            hintText: 'Tulis pesan...',
            hintStyle: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.grey[400]!,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: BaseColor.kGreyColor,
              )
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            header(),
            textForm()
          ],
        ),
      ),
    );
  }
}
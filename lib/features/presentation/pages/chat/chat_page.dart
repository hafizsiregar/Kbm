import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbm/features/presentation/pages/chat/chat_detail_page.dart';
import '../../../../core/utils/source/assets.dart';
import '../../../../core/utils/styles/colors.dart';

class ChatPage extends StatelessWidget {
  static const routeName = 'chat';
  const ChatPage({ Key? key }) : super(key: key);

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
              SizedBox(width: 20),
              Text('Chat',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
              Spacer(),
              Image.asset(BaseIcons.sortIcon)
            ],
          ),
        ),
      );
    }

    Widget itemChat() {
      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailChat.routeName);
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[400]!,
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: <Widget>[
                Image.asset(BaseImages.circleKlinik1),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Klinik Nusa Indah',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text('Lorem Ipsum dot Amer...',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                    ),),
                  ],
                ),
                const Spacer(),
                Image.asset(BaseIcons.messageIcon,
                color: BaseColor.kBlackColor,)
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[ 
            header(),
            itemChat(),
          ],
        ),
      ),
    );
  }
}
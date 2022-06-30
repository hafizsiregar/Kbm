import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbm/core/utils/source/assets.dart';
import '../../../../core/utils/styles/colors.dart';

class ScanPage extends StatefulWidget {
  static const routeName = 'scan';
  const ScanPage({ Key? key }) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  String code = '';
  String getCode = '';

  void scanBarcode() async {
    getCode = await FlutterBarcodeScanner.scanBarcode("#01AA4F", 'BATAL', true, ScanMode.DEFAULT);
    setState(() {
      code = getCode;
    });
  }

  // void scanBarcode() async {
  //   getCode = await FlutterBarcodeScanner.scanBarcode("#01AA4F", 'BATAL', true, ScanMode.DEFAULT);
  //   setState(() {
  //     Navigator.pushNamed(context, DetailScanPage.routeName);
  //   });
  // }

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
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 20),
              Text('SCAN QR',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Center(
        child: Text(
          'Silahkan Tepatkan QR Code\nTepat di bingkai bawah',
          // code,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: BaseColor.kBlackColor,
          ),
        ),
      );
    }

    Widget btnScan() {
      return GestureDetector(
        onTap: () {
          scanBarcode();
        },
        child: Container(
          height: 83,
          width: 83,
          decoration: BoxDecoration(
            color: BaseColor.kRedColor,
            borderRadius: BorderRadius.circular(200),
          ),
          child: Image.asset(
            BaseImages.imgFlash
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              header(),
              const SizedBox(height: 65),
              body(),
              const Spacer(),
              btnScan(),
            ],
          ),
        ),
      ),
    );
  }
}
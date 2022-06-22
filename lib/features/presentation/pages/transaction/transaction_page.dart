import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbm/core/utils/styles/colors.dart';
import '../../../../core/utils/source/assets.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    String _selectedValue = 'Filter';

    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Riwayat Transaksi',
            style: GoogleFonts.lato(
                fontSize: 18,
                color: BaseColor.kBlackColor,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 25,
            width: 91,
            decoration: BoxDecoration(
                color: BaseColor.primaryColor,
                borderRadius: BorderRadius.circular(100)),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  value: _selectedValue,
                  icon: Image.asset(BaseIcons.sortDownIcon),
                  items: const [
                    DropdownMenuItem(
                      value: 'Filter',
                      child: Text('Filter'),
                    ),
                    DropdownMenuItem(
                      value: 'Sort',
                      child: Text('Sort'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget process() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Dalam Proses',
            style: GoogleFonts.lato(
                fontSize: 16,
                color: BaseColor.kBlackColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 21),
          Container(
            height: 75,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: BaseColor.kWhiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 85,
                  decoration: const BoxDecoration(
                      color: BaseColor.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )),
                  child: Image.asset(BaseIcons.klinikIcon),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Klinik Nusa Indah Ciamis',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: BaseColor.kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 21,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: BaseColor.primaryColor,
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: double.infinity,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: BaseColor.primaryColor,
                            ),
                            child: Center(
                              child: Text('Waktu',
                              style: GoogleFonts.lato(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: BaseColor.kWhiteColor
                              ),),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text('Selasa, 11 Januari 08:15 WIB',
                          style: GoogleFonts.lato(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: BaseColor.primaryColor
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget finish() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Selesai',
          style: GoogleFonts.lato(
            fontSize: 16,
            color: BaseColor.kBlackColor,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 25),
          Container(
            height: 75,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: BaseColor.kGreyColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(BaseIcons.emptyIcon, color: BaseColor.kGreyColor),
                const SizedBox(width: 22),
                Text('Maaf belum ada\ntransaksi yang selesai',
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: BaseColor.kGreyColor,
                ),),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: <Widget>[
              header(),
              const SizedBox(height: 32),
              process(),
              const SizedBox(height: 32),
              finish(),
            ],
          ),
        ),
      ),
    );
  }
}

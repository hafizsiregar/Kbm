import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbm/features/presentation/providers/faskes_detail_notifier.dart';
import 'package:kbm/features/presentation/widgets/button_auth.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/source/assets.dart';
import '../../../../core/utils/styles/colors.dart';

class FaskesDetailPage extends StatefulWidget {
  static const routeName = '/faskes-detail';

  final int id;
  FaskesDetailPage({required this.id});

  @override
  State<FaskesDetailPage> createState() => _FaskesDetailPageState();
}

class _FaskesDetailPageState extends State<FaskesDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<FaskesDetailNotifier>(context, listen: false)
          .fetchFaskesDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            Consumer<FaskesDetailNotifier>(
              builder: (context, value, child) {
              return Row(
                children: <Widget>[
                  const Icon(
                    Icons.location_on,
                    color: Colors.black,
                    size: 16,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'Jatisari, Bekasi',
                    style: GoogleFonts.lato(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
              }
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                )),
          ],
        ),
      );
    }

    Widget imgFaskes() {
      return Consumer<FaskesDetailNotifier>(
        builder: (context, value, child) {
        return Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  BaseImages.klinikImages1),
                  fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 30,
                width: 135,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: BaseColor.kWhiteColor,
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(left: 7, top: 4, bottom: 4),
                      height: 20,
                      width: 55,
                      decoration: BoxDecoration(
                        color: BaseColor.primaryColor,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            BaseIcons.locationSmallIcon,
                            color: BaseColor.kWhiteColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '2 Km',
                            style: GoogleFonts.roboto(
                              fontSize: 9,
                              color: BaseColor.kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: BaseColor.primaryColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Ciamis',
                          style: GoogleFonts.roboto(
                              fontSize: 10, color: const Color(0xff8883F0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        }
      );
    }

    Widget contentFaskes() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Klinik Nusa Indah',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 35,
                  width: 148,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: BaseColor.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: BaseColor.kWhiteColor,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '4.8',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: BaseColor.kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: double.infinity,
                        width: 1.5,
                        color: BaseColor.kWhiteColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '12',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: BaseColor.kWhiteColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Review',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: BaseColor.kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: <Widget>[
                const Icon(Icons.location_on, color: Colors.black),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Jl. Raya Jatinagara, Dusun Wetan RT 021 RW 006, Desa Jatinagara, Kecamatan Jatinagara, Kabupaten Ciamis, Jawa Barat 46273',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              children: <Widget>[
                const Icon(Icons.timer_outlined, color: Colors.black),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Buka : Senin - Sabtu = 07:00 - 20:00 WIB',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              children: <Widget>[
                const Icon(Icons.call, color: Colors.black),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '082120037753',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget btnPesan() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: ButtonAuth(
          onPressed: () {},
          text: 'Pemesanan',
          background: BaseColor.primaryColor,
          textColor: BaseColor.kWhiteColor,
          sideColor: BaseColor.primaryColor,
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              header(),
              const SizedBox(height: 20),
              imgFaskes(),
              const SizedBox(height: 25),
              contentFaskes(),
              const SizedBox(height: 40),
              btnPesan(),
            ],
          ),
        ),
      ),
    );
  }
}

// class DetailContent extends StatelessWidget {

//   final Faskes faskes;
//   const DetailContent({ Key? key, required this.faskes }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container( 
      
//     );
//   }
// }
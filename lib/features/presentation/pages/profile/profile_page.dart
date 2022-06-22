import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbm/core/utils/source/assets.dart';
import '../../../../core/utils/styles/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    Widget header() {
      return Center(
        child: Text(
          'My Profile',
          style: GoogleFonts.roboto(
            fontSize: 24,
            color: BaseColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    Widget cardProfile() {
      return Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 40),
            height: 74,
            width: 74,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: BaseColor.kWhiteColor,
              boxShadow: [
                BoxShadow(
                  color: BaseColor.kGreyColor,
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Image.asset(BaseImages.profileImages),
          ),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Muhammad Mursyid Naufal',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: BaseColor.kBlackColor,
                ),
              ),
              const SizedBox(height: 11),
              Container(
                height: 25,
                width: 136,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: BaseColor.primaryColor,
                ),
                child: Center(
                  child: Text(
                    'Lihat Profile Saya',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: BaseColor.kWhiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget tab() {
      return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: BaseColor.kSecondGreyColor),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: BaseColor.kBlackColor,
                  unselectedLabelColor: BaseColor.primaryColor,
                  labelColor: BaseColor.kBlackColor,
                  tabs: const [
                    Tab(text: 'Reward'),
                    Tab(text: 'Review'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: <Widget>[
                        Text(
                          'Upps, Belum ada Reward\nyang kamu miliki',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: BaseColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset(BaseImages.rewardImages)
                      ],
                    ),
                    Text(
                      'Maaf belum ada\ntransaksi yang selesai',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: BaseColor.kGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    }

    return Scaffold(
      backgroundColor: BaseColor.kWhiteColor,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 37),
            header(),
            const SizedBox(height: 40),
            cardProfile(),
            const SizedBox(height: 27),
            tab(),
          ],
        ),
      ),
    );
  }
}

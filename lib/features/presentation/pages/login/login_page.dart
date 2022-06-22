import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbm/core/utils/source/assets.dart';
import 'package:kbm/core/utils/styles/colors.dart';
import 'package:kbm/features/presentation/pages/main/main_page.dart';
import 'package:kbm/features/presentation/pages/register/register_page.dart';
import 'package:kbm/features/presentation/widgets/button_auth.dart';
import '../../widgets/button_google.dart';
import '../../widgets/custom_txt_form_field.dart';

class LoginPage extends StatelessWidget {

  static const routeName = 'login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 115, left: 40, right: 40),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text('Masuk',
                  style: GoogleFonts.lato(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
                const SizedBox(height: 50),
                ButtonGoogle(
                  img: BaseIcons.googleIcon,
                  txtSpan1: 'Masuk dengan',
                  txtSpan2: ' Akun Google',
                ),
                const SizedBox(height: 26),
                Text('Atau Masuk dengan Email',
                style: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                ),),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Email Address',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                const SizedBox(height: 9),
                CustomTxtFormField(
                  hintText: 'Masukkan email kamu',
                  obscureText: false,
                ),
                const SizedBox(height: 9),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Password',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                const SizedBox(height: 9),
                CustomTxtFormField(
                  hintText: 'Masukkan password kamu',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topRight,
                  child: Text('Lupa Password?',
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    color: Colors.black
                  )),
                ),
                const SizedBox(height: 43),
                ButtonAuth(
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, MainPage.routeName);
                  },
                  textColor: BaseColor.kWhiteColor,
                  sideColor: BaseColor.kWhiteColor,
                  background: BaseColor.primaryColor,
                ),
                const SizedBox(height: 14),
                ButtonAuth(
                  text: 'Daftar Akun',
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterPage.routeName);
                  },
                  textColor: BaseColor.primaryColor,
                  sideColor: BaseColor.primaryColor,
                  background: BaseColor.kWhiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
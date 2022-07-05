import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbm/core/utils/source/assets.dart';
import 'package:kbm/features/presentation/pages/main/main_page.dart';
import 'package:kbm/features/presentation/widgets/button_google.dart';
import '../../../../core/utils/styles/colors.dart';
import '../../widgets/button_auth.dart';
import '../../widgets/custom_txt_form_field.dart';
import '../login/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController nameController = 
    TextEditingController(text: '');

  TextEditingController emailController = 
    TextEditingController(text: '');  

  TextEditingController passwordController = 
    TextEditingController(text: '');  

  @override
  Widget build(BuildContext context) {
    bool agree = false;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 42, left: 40, right: 40),
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new),
                    )),
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'Daftar Akun',
                    style: GoogleFonts.lato(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ButtonGoogle(
                  img: BaseIcons.googleIcon,
                  txtSpan1: 'Daftar dengan',
                  txtSpan2: ' Akun Google',
                ),
                const SizedBox(height: 26),
                Text(
                  'Atau Daftar dengan Email',
                  style: GoogleFonts.lato(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Nama Lengkap',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                CustomTxtFormField(
                  controller: nameController,
                  hintText: 'Masukkan nama kamu',
                  obscureText: false,
                ),
                const SizedBox(height: 9),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                CustomTxtFormField(
                  controller: emailController,
                  hintText: 'Masukkan email kamu',
                  obscureText: false,
                ),
                const SizedBox(height: 9),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Password',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                CustomTxtFormField(
                  controller: passwordController,
                  hintText: 'Masukkan password kamu',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Checkbox(
                      side: const BorderSide(
                        color: BaseColor.primaryColor,
                        width: 2,
                      ),
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value!;
                        });
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'I agree the',
                              style: GoogleFonts.lato(
                                  fontSize: 12, color: Colors.black)),
                          TextSpan(
                              text: ' Terms & Conditions',
                              style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: BaseColor.kBlueColor)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 37),
                ButtonAuth(
                  text: 'Daftar Akun',
                  onPressed: () {
                    Navigator.pushNamed(context, MainPage.routeName);
                  },
                  textColor: BaseColor.kWhiteColor,
                  sideColor: BaseColor.kWhiteColor,
                  background: BaseColor.primaryColor,
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Sudah Memiliki Akun?',
                          style: GoogleFonts.lato(
                              fontSize: 12, color: Colors.black)),
                      TextSpan(
                          onEnter: (event) => Navigator.pushNamed
                          (context, LoginPage.routeName),
                          text: ' Masuk',
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: BaseColor.kBlueColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

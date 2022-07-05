import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbm/config/base_url_config.dart';
import 'package:kbm/core/utils/source/assets.dart';
import 'package:kbm/core/utils/styles/colors.dart';
import 'package:kbm/features/presentation/pages/home/home_page.dart';
import 'package:kbm/features/presentation/pages/main/main_page.dart';
import 'package:kbm/features/presentation/pages/register/register_page.dart';
import 'package:kbm/features/presentation/providers/login_notifier.dart';
import 'package:kbm/features/presentation/widgets/button_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/login/login_body_model.dart';
import '../../widgets/button_google.dart';
import '../../widgets/custom_txt_form_field.dart';

class LoginPage extends StatefulWidget {

  static const routeName = 'login';
  // final LoginBodyModel loginBodyModel;
  // final String email;
  // final String password;

  const LoginPage({
    Key? key,
    // required this.loginBodyModel
    // required this.email,
    // required this.password,
    }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = 
    TextEditingController();

  final TextEditingController passwordController = 
    TextEditingController();  

  @override
  void initState() {
    super.initState();
    // Future.microtask(() {
    //   Provider.of<LoginNotifier>(context, listen: false)
    //   .fetchLogin(
    //     widget.email,
    //     widget.password
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {

    // LoginNotifier loginNotifier = Provider.of<LoginNotifier>(context);
    // login() async {
    //   if (await loginNotifier.fetchLogin(
    //     emailController.text, 
    //     passwordController.text)) {
    //       Navigator.pushNamed(context, HomePage.routeName);
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text('Gagal Login')
    //       )
    //     );
    //   }
    // }

    bool _isLoading = false;

    Future<void> login(String email, String password) async {
      String url = BaseUrlConfig.baseUrlProductionPanelEndPoint;
      String urlLogin = '$url/login';
      var headers = {
        'Content-Type': 'application/json'
      };
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var body = jsonEncode(
        {
          "email": email,
          "password": password
        }
      );
      var jsonResponse;
      var dio = Dio();
      var response = await dio.post(
        urlLogin, 
        data: body, 
        options: Options(headers: headers)
      );

      if (response.statusCode == 200) {
        jsonResponse = response.data;
        print(response.data);

        if(jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });

          sharedPreferences.setString('token', jsonResponse['access_token']);
          Navigator.pushNamedAndRemoveUntil(
            context, MainPage.routeName, (Route<dynamic> route) => false
          );
        } else {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gagal Login')
            )
          );
        }
      }
    }
    
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
                  controller: emailController,
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
                  controller: passwordController,
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
                    emailController.text.isEmpty || passwordController.text.isEmpty
                    ? ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email dan Password tidak boleh kosong')
                      )
                    )
                    : setState(() {
                      _isLoading = true;
                    });
                    login(emailController.text, passwordController.text);
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
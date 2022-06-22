import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Widget ini berfungsi untuk menampilkan widget [CircularProgressIndicator] <br />
/// dan [CupertinoActivityIndicator] sesuai dengan style native-nya masing-masing yaitu material dan cupertino. <br />
/// Dan meletakkannya ditengah-tengah.
class WidgetLoadingCenter extends StatelessWidget {
  const WidgetLoadingCenter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    );
  }
}
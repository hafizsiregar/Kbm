import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/styles/colors.dart';
import '../providers/main_page_notifier.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String imgUrl;
  final int index;

  const CustomBottomNavBar({
    Key? key,
    required this.imgUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainPageNotifier>(context);
    return GestureDetector(
      onTap: () {
        provider.currentIndex = index;
      },
      child: Image.asset(
        imgUrl,
        width: 25,
        height: 25,
        color: provider.currentIndex == index
            ? BaseColor.primaryColor
            : BaseColor.kGreyColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kbm/core/utils/source/assets.dart';
import 'package:kbm/core/utils/styles/colors.dart';
import 'package:kbm/features/presentation/providers/main_page_notifier.dart';
import 'package:kbm/features/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../transaction/transaction_page.dart';

class MainPage extends StatelessWidget {
  static const routeName = 'main';

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainPageNotifier>(context);
    return Stack(
      children: <Widget>[
        _buildContent(provider.currentIndex),
        _customBottomNav(),
      ],
    );
  }

  Widget _buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const TransactionPage();
      case 2:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  Widget _customBottomNav() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(
          bottom: 12,
          left: 28,
          right: 28,
        ),
        decoration: BoxDecoration(
          color: BaseColor.kWhiteColor,
          borderRadius: BorderRadius.circular(200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CustomBottomNavBar(
              imgUrl: BaseIcons.homeIcon,
              index: 0,
            ),
            CustomBottomNavBar(
              imgUrl: BaseIcons.transactionIcon,
              index: 1,
            ),
            CustomBottomNavBar(
              imgUrl: BaseIcons.profileIcon,
              index: 2,
            ),
          ],
        ),
      ),
    );
  }
}

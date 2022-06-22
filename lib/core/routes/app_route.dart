import 'package:flutter/material.dart';
import 'package:kbm/features/presentation/pages/chat/chat_detail_page.dart';
import 'package:kbm/features/presentation/pages/chat/chat_page.dart';
import 'package:kbm/features/presentation/pages/detail/faskes_detail_page.dart';
import 'package:kbm/features/presentation/pages/home/home_page.dart';
import 'package:kbm/features/presentation/pages/login/login_page.dart';
import 'package:kbm/features/presentation/pages/main/main_page.dart';
import 'package:kbm/features/presentation/pages/register/register_page.dart';
import 'package:kbm/features/presentation/pages/splash/splash_page.dart';

class AppRoute {

  static Route<dynamic> generateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(
        )
      );
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(
        )
      );
      case RegisterPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(
        )
      );
      case MainPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const MainPage(
        )
      );
      case ChatPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ChatPage(
        )
      );
      case DetailChat.routeName:
        return MaterialPageRoute(
          builder: (context) => const DetailChat(
        )
      );
      case FaskesDetailPage.routeName:
      final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => FaskesDetailPage(id: id),
          settings: settings
      );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
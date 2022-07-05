import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:kbm/core/routes/app_route.dart';
import 'package:kbm/features/presentation/pages/splash/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kbm/features/presentation/providers/faskes_list_notifier.dart';
import 'package:kbm/features/presentation/providers/main_page_notifier.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'features/presentation/providers/clinic_list_notifier.dart';
import 'features/presentation/providers/hospitals_list_notifier.dart';
import 'features/presentation/providers/login_notifier.dart';
import 'injection_container.dart' as di;
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final bool isEnableDevicePreview;

  const MyApp({
    Key? key,
    this.isEnableDevicePreview = false,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _hideSoftKeyboard(BuildContext context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainPageNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.sl<FaskesListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.sl<HospitalsListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.sl<ClinicListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.sl<LoginNotifier>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context) => MaterialApp(
          navigatorObservers: [
            SentryNavigatorObserver(),
          ],
          title: 'Klinik Berhenti Merokok',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
          onGenerateRoute: (settings) => AppRoute.generateRoute(settings, context),
          builder: widget.isEnableDevicePreview
              ? DevicePreview.appBuilder
              : (ctx, child) {
                  return GestureDetector(
                    onTap: () {
                      if (Platform.isIOS) {
                        _hideSoftKeyboard(context);
                      }
                    },
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child ?? Container(),
                    ),
                  );
                },
        ),
      ),
    );
  }
}

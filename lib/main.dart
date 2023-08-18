import 'package:flutter/material.dart';
import 'package:ghasedak/core/routes.dart';
import 'package:ghasedak/core/styles/themes.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/login/presentation/pages/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ghasedak/pages/main/presentation/pages/main_page.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: LoginPage.pageRoute,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale("fa", "IR"),
      title: 'Ghasedak',
      theme: mainDayTheme,
    );
  }
}

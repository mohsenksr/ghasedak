import 'package:flutter/material.dart';
import 'package:ghasedak/pages/channel_info_page.dart';
import 'package:ghasedak/pages/channel_page.dart';
import 'package:ghasedak/pages/get_code_page.dart';
import 'package:ghasedak/pages/get_info.dart';
import 'package:ghasedak/pages/login_page.dart';
import 'package:ghasedak/pages/main_page.dart';
import 'package:ghasedak/pages/register_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  RegisterPage.pageRoute: (BuildContext context) => const RegisterPage(),
  LoginPage.pageRoute: (BuildContext context) => const LoginPage(),
  GetInfoPage.pageRoute: (BuildContext context) => const GetInfoPage(),
  GetCodePage.pageRoute: (BuildContext context) => const GetCodePage(),
  MainPage.pageRoute: (BuildContext context) => const MainPage(),
  ChannelPage.pageRoute: (BuildContext context) => const ChannelPage(),
  ChannelInfoPage.pageRoute: (BuildContext context) => const ChannelInfoPage(),
};

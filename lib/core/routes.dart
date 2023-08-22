import 'package:flutter/material.dart';
import 'package:ghasedak/pages/channel_info/presentation/pages/channel_info.dart';
import 'package:ghasedak/pages/channel/presentation/pages/channel.dart';
import 'package:ghasedak/pages/get_code/presentation/pages/get_code.dart';
import 'package:ghasedak/pages/get_info/presentation/pages/get_info.dart';
import 'package:ghasedak/pages/login/presentation/pages/login.dart';
import 'package:ghasedak/pages/channels_list/presentation/pages/channels_list.dart';
import 'package:ghasedak/pages/main/presentation/pages/main_page.dart';
import 'package:ghasedak/pages/profile/presentation/pages/profile_page.dart';
import 'package:ghasedak/pages/register/presentation/pages/register.dart';

Map<String, Widget Function(BuildContext)> routes = {
  MainPage.pageRoute: (BuildContext context) => const MainPage(),
  RegisterPage.pageRoute: (BuildContext context) => const RegisterPage(),
  LoginPage.pageRoute: (BuildContext context) => const LoginPage(),
  ProfilePage.pageRoute: (BuildContext context) => const ProfilePage(),
  GetInfoPage.pageRoute: (BuildContext context) => const GetInfoPage(),
  GetCodePage.pageRoute: (BuildContext context) => const GetCodePage(),
  ChannelPage.pageRoute: (BuildContext context) => const ChannelPage(),
  ChannelInfoPage.pageRoute: (BuildContext context) => const ChannelInfoPage(),
};

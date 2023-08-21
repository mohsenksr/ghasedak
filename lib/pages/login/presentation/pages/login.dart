import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/channels_list/presentation/pages/channels_list.dart';
import 'package:ghasedak/pages/main/domain/main_cubit.dart';
import 'package:ghasedak/pages/register/presentation/pages/register.dart';

class LoginPage extends StatefulWidget {
  static const String pageRoute = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'نام کاربری',
              ),
            ),
            Container(height: 30),
             TextField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'رمز عبور',
              ),
            ),
            Container(height: 30),
            ElevatedButton(
              onPressed: () {
                getIt<MainCubit>()
                    .login(usernameController.text, passwordController.text);
              },
              child: Text("ورود"),
            ),
            Container(height: 30),
            TextButton(onPressed: () {}, child: Text("فراموشی رمز عبور")),
            TextButton(
                onPressed: () {
                  getIt<MainCubit>().goToRegisterPage();
                },
                child: Text("ثبت نام")),
          ],
        ),
      ),
    );
  }
}

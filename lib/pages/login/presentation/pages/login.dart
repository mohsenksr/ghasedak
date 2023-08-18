import 'package:flutter/material.dart';
import 'package:ghasedak/pages/channels_list/presentation/pages/channels_list.dart';
import 'package:ghasedak/pages/register/presentation/pages/register.dart';

class LoginPage extends StatefulWidget {
  static const String pageRoute = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ورود", style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'نام کاربری',
                ),
              ),
              Container(height: 30),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'رمز عبور',
                ),
              ),
              Container(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    ChannelsListPage.pageRoute,
                  );
                },
                child: Text("ورود"),
              ),
              Container(height: 30),
              TextButton(onPressed: () {}, child: Text("فراموشی رمز عبور")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              RegisterPage.pageRoute,
            );
          },
          child: Text("ثبت نام")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ghasedak/pages/login_page.dart';
import 'package:ghasedak/pages/register_page.dart';

class GetInfoPage extends StatefulWidget {
  static const String pageRoute = '/get-info';
  const GetInfoPage({super.key});

  @override
  State<GetInfoPage> createState() => _GetInfoPageState();
}

class _GetInfoPageState extends State<GetInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("وارد کردن اطلاعات", style: TextStyle(color: Colors.black)),
        leading: BackButton(color: Colors.black),
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
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(RegisterPage.pageRoute),
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      LoginPage.pageRoute,
                    );
                  },
                  child: Text("اتمام ثبت نام")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName(RegisterPage.pageRoute),
            );
            Navigator.pushReplacementNamed(
              context,
              LoginPage.pageRoute,
            );
          },
          child: Text("ورود")),
    );
  }
}

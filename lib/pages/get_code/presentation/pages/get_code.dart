import 'package:flutter/material.dart';
import 'package:ghasedak/pages/get_info/presentation/pages/get_info.dart';
import 'package:ghasedak/pages/login/presentation/pages/login.dart';
import 'package:ghasedak/pages/register/presentation/pages/register.dart';

class GetCodePage extends StatefulWidget {
  static const String pageRoute = '/get-code';
  const GetCodePage({super.key});

  @override
  State<GetCodePage> createState() => _GetCodePageState();
}

class _GetCodePageState extends State<GetCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ثبت نام", style: TextStyle(color: Colors.black)),
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
                  labelText: 'کد دریافتی',
                ),
              ),
              Container(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetInfoPage()),
                    );
                  },
                  child: Text("مرحله بعد")),
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

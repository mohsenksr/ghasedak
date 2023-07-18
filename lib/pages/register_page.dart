import 'package:flutter/material.dart';
import 'package:ghasedak/pages/get_code_page.dart';
import 'package:ghasedak/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const String pageRoute = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ثبت نام", style: TextStyle(color: Colors.black)),
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
                  labelText: 'شماره موبایل',
                ),
              ),
              Container(height: 10),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Text("یا"),
                  Expanded(child: Divider()),
                ],
              ),
              Container(height: 10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ایمیل',
                ),
              ),
              Container(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetCodePage()),
                    );
                  },
                  child: Text("مرحله بعد")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,  
              LoginPage.pageRoute,
            );
          },
          child: Text("ورود")),
    );
  }
}

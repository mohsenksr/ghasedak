import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/login/presentation/pages/login.dart';
import 'package:ghasedak/pages/main/domain/main_cubit.dart';
import 'package:ghasedak/pages/main/presentation/pages/main_page.dart';
import 'package:ghasedak/pages/register/presentation/pages/register.dart';

class GetInfoPage extends StatefulWidget {
  static const String pageRoute = '/get-info';
  const GetInfoPage({super.key});

  @override
  State<GetInfoPage> createState() => _GetInfoPageState();
}

class _GetInfoPageState extends State<GetInfoPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'نام',
                ),
              ),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'نام خانوادگی',
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ایمیل',
                ),
              ),
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
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(MainPage.pageRoute),
                    );
                    // Navigator.pushReplacementNamed(
                    //   context,
                    //   LoginPage.pageRoute,
                    // );
                    getIt<MainCubit>().register(
                      firstNameController.text,
                      lastNameController.text,
                      usernameController.text,
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  child: Text("اتمام ثبت نام")),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.popUntil(
      //         context,
      //         ModalRoute.withName(RegisterPage.pageRoute),
      //       );
      //       Navigator.pushReplacementNamed(
      //         context,
      //         LoginPage.pageRoute,
      //       );
      //     },
      //     child: Text("ورود")),
    );
  }
}

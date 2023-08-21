import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/get_code/presentation/pages/get_code.dart';
import 'package:ghasedak/pages/login/presentation/pages/login.dart';
import 'package:ghasedak/pages/main/domain/main_cubit.dart';

class RegisterPage extends StatefulWidget {
  static const String pageRoute = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
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
                  getIt<MainCubit>()
                      .sendRegisterationPhone(phoneController.text);
                },
                child: Text("مرحله بعد")),
            TextButton(
                onPressed: () {
                  getIt<MainCubit>().goToLoginPage();
                },
                child: Text("ورود")),
          ],
        ),
      ),
    );
  }
}

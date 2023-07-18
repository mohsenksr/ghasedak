import 'package:flutter/material.dart';
import 'package:ghasedak/pages/login_page.dart';
import 'package:ghasedak/widgets/channel_item.dart';

class MainPage extends StatefulWidget {
  static const String pageRoute = '/main';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("قاصدک", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChannelItem(1, "گیزمیز", "۱۳:۲۰"),
          ChannelItem(2, "خبرگزاری", "۱۱:۲۰"),
          ChannelItem(2, "اطلاعات عمومی", "۲۲ تیر"),  
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}

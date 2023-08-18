import 'package:flutter/material.dart';
import 'package:ghasedak/widgets/subscription_item.dart';
import 'package:ghasedak/widgets/user_item.dart';

class ChannelInfoPage extends StatefulWidget {
  static const String pageRoute = '/channel-info';
  const ChannelInfoPage({super.key});

  @override
  State<ChannelInfoPage> createState() => _ChannelInfoPageState();
}

class _ChannelInfoPageState extends State<ChannelInfoPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("اطلاعات کانال", style: TextStyle(color: Colors.black)),
        leading: BackButton(color: Colors.black),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              args["title"],
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              "متن امتحانی برای توضیحات کانال شامل توضیح مختصری راجع به کانال و هدف و محتوای آن. در این قسمت اگر توضیحی راجع به هدف است گفته می‌شود و سعی می‌شود از توضیحات اضافه خودداری شود تا اتفاق بدی رقم نخورد.",
              textAlign: TextAlign.center,
            ),
            Divider(height: 15),
            Row(
              children: [
                Expanded(child: Divider()),
                Text(
                  "مدیران کانال",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Expanded(child: Divider()),
              ],
            ),
            UserItem(
              12,
              "ادمین ادمین‌زاده",
              percent: 10,
            ),
            UserItem(
              20,
              "مدیر مدیرپور",
              percent: 15,
            ),
            UserItem(
              12,
              "مدیر مدیریان",
              percent: 18,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("افزودن مدیر"),
            ),
            Container(height: 50),
            Row(
              children: [
                Expanded(child: Divider()),
                Text(
                  "اشتراک‌های کانال",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Expanded(child: Divider()),
              ],
            ),
            SubscriptionItem(12, "اشتراک یک ماهه", 50000),
            SubscriptionItem(12, "اشتراک سه ماهه", 120000),
            SubscriptionItem(12, "اشتراک شش ماهه", 200000),
            ElevatedButton(
              onPressed: () {},
              child: Text("افزودن اشتراک"),
            ),
            Container(height: 50),
            Row(
              children: [
                Expanded(child: Divider()),
                Text(
                  "اعضای کانال",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Expanded(child: Divider()),
              ],
            ),
            UserItem(
              12,
              "کاربر کاربریان",
            ),
            UserItem(
              20,
              "یوزر یوزریان",
            ),
            UserItem(
              12,
              "مخاطب مخاطب‌زاده",
            ),
          ],
        ),
      ),
    );
  }
}

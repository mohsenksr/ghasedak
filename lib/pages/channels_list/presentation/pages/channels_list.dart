import 'package:flutter/material.dart';
import 'package:ghasedak/pages/login/presentation/pages/login.dart';
import 'package:ghasedak/widgets/channel_item.dart';

class ChannelsListPage extends StatefulWidget {
  static const String pageRoute = '/channels-list';
  const ChannelsListPage({super.key});

  @override
  State<ChannelsListPage> createState() => _ChannelsListPageState();
}

class _ChannelsListPageState extends State<ChannelsListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChannelItem(1, "گیزمیز", "۱۳:۲۰"),
        ChannelItem(2, "خبرگزاری", "۱۱:۲۰"),
        ChannelItem(2, "اطلاعات عمومی", "۲۲ تیر"),
      ],
    );
  }
}

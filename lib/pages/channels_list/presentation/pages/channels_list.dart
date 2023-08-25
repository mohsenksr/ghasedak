import 'package:flutter/material.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/login/presentation/pages/login.dart';
import 'package:ghasedak/pages/main/data/models/channel.dart';
import 'package:ghasedak/pages/main/domain/main_cubit.dart';
import 'package:ghasedak/pages/profile/presentation/pages/profile_page.dart';
import 'package:ghasedak/widgets/channel_item.dart';

class ChannelsListPage extends StatefulWidget {
  static const String pageRoute = '/channels-list';
  final Map<String, List<Channel>> channels;
  const ChannelsListPage(this.channels, {super.key});

  @override
  State<ChannelsListPage> createState() => _ChannelsListPageState();
}

class _ChannelsListPageState extends State<ChannelsListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  final TextEditingController idController =
                      TextEditingController();
                  final TextEditingController titleController =
                      TextEditingController();
                  final TextEditingController bioController =
                      TextEditingController();

                  return AlertDialog(
                    content: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            controller: idController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'آیدی کانال',
                            ),
                          ),
                          Container(height: 30),
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'عنوان کانال',
                            ),
                          ),
                          Container(height: 30),
                          TextField(
                            controller: bioController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'بیو کانال',
                            ),
                          ),
                          Container(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              getIt<MainCubit>().createChannel(
                                titleController.text,
                                idController.text,
                                bioController.text,
                              );
                              Navigator.of(context).pop();
                            },
                            child: Text("ایجاد کانال"),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Text("ایجاد کانال"),
        ),
        Container(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  final TextEditingController idController =
                      TextEditingController();

                  return AlertDialog(
                    content: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            controller: idController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'آیدی کانال',
                            ),
                          ),
                          Container(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              getIt<MainCubit>().joinChannel(idController.text);
                              Navigator.of(context).pop();
                            },
                            child: Text("عضویت در کانال"),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Text("عضویت در کانال"),
        ),
        Container(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ProfilePage.pageRoute);
          },
          child: Text("پروفایل"),
        ),
        Container(
          height: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              children: [
                Expanded(child: Divider()),
                Text("صاحب کانال"),
                Expanded(child: Divider()),
              ],
            ),
            ...widget.channels["owner"]!.map(
              (e) => ChannelItem(e.id, e.title, e.lastContent, "owner"),
            ),
            Container(height: 30),
            const Row(
              children: [
                Expanded(child: Divider()),
                Text("مدیر کانال"),
                Expanded(child: Divider()),
              ],
            ),
            ...widget.channels["admin"]!.map(
              (e) => ChannelItem(e.id, e.title, e.lastContent, "admin"),
            ),
            Container(height: 30),
            const Row(
              children: [
                Expanded(child: Divider()),
                Text("عضو کانال"),
                Expanded(child: Divider()),
              ],
            ),
            ...widget.channels["member"]!.map(
              (e) => ChannelItem(e.id, e.title, e.lastContent, "member"),
            ),
          ],
        ),
      ],
    );
  }
}

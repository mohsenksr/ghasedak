import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/channel_info/domain/channel_info_cubit.dart';
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
    final mode = args["mode"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("اطلاعات کانال", style: TextStyle(color: Colors.black)),
        leading: BackButton(color: Colors.black),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ChannelInfoCubit>(
              create: (BuildContext context) => getIt<ChannelInfoCubit>(),
            )
          ],
          child: BlocBuilder<ChannelInfoCubit, ChannelInfoState>(
              builder: (context, state) {
            print(state);
            if (state is ChannelInfoInitialState) {
              if (mode == "owner") {
                getIt<ChannelInfoCubit>().getDescription(args["id"], true);
              } else {
                getIt<ChannelInfoCubit>().getDescription(args["id"], false);
              }
              return CircularProgressIndicator();
            } else if (state is ChannelInfoLoadingState) {
              return CircularProgressIndicator();
            } else if (state is ChannelInfoShowState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    state.description.title,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "@" + state.description.channelId,
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    state.description.bio,
                    textAlign: TextAlign.center,
                  ),
                  Divider(height: 15),
                  mode == "owner"
                      ? Column(
                          children: [
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
                            ...state.adminData!["admins"].map(
                              (e) => UserItem("$e.id", e.fullName,
                                  percent: e.percent),
                            ),
                            // UserItem(
                            //   12,
                            //   "ادمین ادمین‌زاده",
                            //   percent: 10,
                            // ),
                            // UserItem(
                            //   20,
                            //   "مدیر مدیرپور",
                            //   percent: 15,
                            // ),
                            // UserItem(
                            //   12,
                            //   "مدیر مدیریان",
                            //   percent: 18,
                            // ),
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
                            ...state.adminData!["subscriptions"].map(
                              (e) =>
                                  SubscriptionItem(e.id, e.duration, e.price),
                            ),
                            // SubscriptionItem(12, "اشتراک یک ماهه", 50000),
                            // SubscriptionItem(12, "اشتراک سه ماهه", 120000),
                            // SubscriptionItem(12, "اشتراک شش ماهه", 200000),
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
                            ...state.adminData!["members"].map(
                              (e) => UserItem(e.username, e.fullName),
                            ),
                            // UserItem(
                            //   12,
                            //   "کاربر کاربریان",
                            // ),
                            // UserItem(
                            //   20,
                            //   "یوزر یوزریان",
                            // ),
                            // UserItem(
                            //   12,
                            //   "مخاطب مخاطب‌زاده",
                            // ),
                          ],
                        )
                      : Container(),
                ],
              );
            }
            return Container(
              child: Column(
                children: [
                  Text("مشکلی پیش آمده‌است."),
                  Container(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getIt<ChannelInfoCubit>()
                          .getDescription(args["id"], false);
                    },
                    child: Text("بارگیری دوباره صفحه"),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

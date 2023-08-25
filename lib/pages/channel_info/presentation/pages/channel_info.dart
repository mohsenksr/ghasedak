import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_subscription.dart';
import 'package:ghasedak/pages/channel_info/domain/channel_info_cubit.dart';
import 'package:ghasedak/pages/channel_info/presentation/widgets/create_subscription_widget.dart';
import 'package:ghasedak/widgets/subscription_item.dart';
import 'package:ghasedak/widgets/user_item.dart';

class ChannelInfoPage extends StatefulWidget {
  static const String pageRoute = '/channel-info';
  final ChannelInfoCubit channelInfoCubit = getIt<ChannelInfoCubit>();

  ChannelInfoPage({super.key});

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
              create: (BuildContext context) => widget.channelInfoCubit,
            )
          ],
          child: BlocBuilder<ChannelInfoCubit, ChannelInfoState>(
              builder: (context, state) {
            print(state);
            if (state is ChannelInfoInitialState) {
              if (mode == "owner") {
                widget.channelInfoCubit.getDescription(args["id"], true);
              } else {
                widget.channelInfoCubit.getDescription(args["id"], false);
              }
              return Center(child: CircularProgressIndicator());
            } else if (state is ChannelInfoLoadingState) {
              return Center(child: CircularProgressIndicator());
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
                  Container(height: 15),
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
                            Container(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      final TextEditingController
                                          usernameController =
                                          TextEditingController();
                                      final TextEditingController
                                          percentController =
                                          TextEditingController();

                                      return AlertDialog(
                                        content: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              TextField(
                                                controller: usernameController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'نام کاربری مدیر',
                                                ),
                                              ),
                                              Container(height: 30),
                                              TextField(
                                                controller: percentController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'درصد بهره‌وری',
                                                ),
                                              ),
                                              Container(height: 30),
                                              ElevatedButton(
                                                onPressed: () {
                                                  widget.channelInfoCubit
                                                      .createAdmin(
                                                    state.description.id,
                                                    usernameController.text,
                                                    int.parse(
                                                        percentController.text),
                                                  );
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("افزودن مدیر"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
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
                              (Subscription e) => SubscriptionItem(
                                e.id,
                                e.duration.persianString,
                                e.price,
                              ),
                            ),
                            Container(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CreateSubscriptionWidget(
                                          widget.channelInfoCubit, state);
                                    });
                              },
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
                          ],
                        )
                      : Column(
                          children: [
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
                            ...state.subscriptions!.map(
                              (Subscription e) => SubscriptionItem(
                                e.id,
                                e.duration.persianString,
                                e.price,
                                adminMode: false,
                                buyCallback: () {
                                  widget.channelInfoCubit.buySubscription(e.id);
                                },
                              ),
                            ),
                            Container(height: 20),
                          ],
                        ),
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
                      widget.channelInfoCubit.getDescription(args["id"], false);
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

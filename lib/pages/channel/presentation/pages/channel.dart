import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:ghasedak/pages/channel/data/models/post.dart';
import 'package:ghasedak/pages/channel/domain/channel_cubit.dart';
import 'package:ghasedak/pages/channel/presentation/widgets/add_post_widget.dart';
import 'package:ghasedak/pages/channel/presentation/widgets/show_post_file.dart';
import 'package:ghasedak/pages/channel_info/presentation/pages/channel_info.dart';

class ChannelPage extends StatefulWidget {
  static const String pageRoute = '/channel';
  final ChannelCubit channelCubit = getIt<ChannelCubit>();
  ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final mode = args["mode"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(args["title"], style: TextStyle(color: Colors.black)),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ChannelInfoPage.pageRoute,
                  arguments: args,
                );
              },
              child: Container(
                margin: EdgeInsets.all(20),
                child: Icon(
                  mode == "member" ? Icons.info : Icons.admin_panel_settings,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        leading: BackButton(color: Colors.black),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<ChannelCubit>(
                create: (BuildContext context) => widget.channelCubit,
              )
            ],
            child: BlocConsumer<ChannelCubit, ChannelState>(
                listener: (context, state) {
              if (state is ChannelShowPostState) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ShowPostWidget(
                          state.contentTextOrLink, state.type);
                    });
              }
            }, builder: (context, state) {
              if (state is ChannelInitialState) {
                widget.channelCubit.getChannelPosts(args["id"]);
                return Center(child: CircularProgressIndicator());
              }
              if (state is ChannelLoadingState) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is ChannelNewPostAddedState) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is ChannelShowState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddPostWidget(
                                  args["id"], widget.channelCubit);
                            });
                      },
                      child: Text("افزودن پست"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...state.posts.map(
                          (e) => Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Text(e.summary ?? "no summary",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(color: Colors.black)),
                                ),
                                Container(
                                  height: 5,
                                ),
                                Text(e.type.stringMode,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.black)),
                                Container(height: 5),
                                Text(e.createdDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.black)),
                                Container(height: 5),
                                e.free
                                    ? Text("رایگان",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.black))
                                    : Text("${e.price} تومان",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.black)),
                                Container(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    mode == "member"
                                        ? ElevatedButton(
                                            onPressed: () {
                                              widget.channelCubit
                                                  .buyContent(e.id);
                                            },
                                            child: Text("خرید"),
                                          )
                                        : Container(),
                                    Container(width: 5),
                                    ElevatedButton(
                                      onPressed: () {
                                        widget.channelCubit
                                            .getContentFile(e.id, e.type);
                                      },
                                      child: Text("دریافت فایل"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // MessageBar(
                        //   onSend: (_) => print(_),
                        //   actions: [
                        //     InkWell(
                        //       child: Icon(
                        //         Icons.add,
                        //         color: Colors.black,
                        //         size: 24,
                        //       ),
                        //       onTap: () {},
                        //     ),
                        //     Padding(
                        //       padding: EdgeInsets.only(left: 8, right: 8),
                        //       child: InkWell(
                        //         child: Icon(
                        //           Icons.camera_alt,
                        //           color: Colors.green,
                        //           size: 24,
                        //         ),
                        //         onTap: () {},
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
                        widget.channelCubit.getChannelPosts(args["id"]);
                      },
                      child: Text("بارگیری دوباره صفحه"),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

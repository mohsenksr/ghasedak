import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:ghasedak/pages/channel_info/presentation/pages/channel_info.dart';

class ChannelPage extends StatefulWidget {
  static const String pageRoute = '/channel';
  const ChannelPage({super.key});

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
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BubbleSpecialThree(
              text: 'Sure',
              color: Color(0xFFE8E8EE),
              tail: false,
              isSender: false,
            ),
            BubbleNormalAudio(
              color: Color(0xFFE8E8EE),
              duration: 3,
              position: 0,
              isPlaying: false,
              isLoading: false,
              isPause: true,
              onSeekChanged: (double) {},
              onPlayPauseButtonClick: () {},
              sent: false,
              isSender: false,
            ),
            BubbleNormalImage(
              id: 'id001',
              image: Image.asset("assets/images/temp.jpeg"),
              color: Color(0xFFE8E8EE),
              tail: true,
              delivered: true,
              isSender: false,
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
      ),
    );
  }
}

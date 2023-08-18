import 'package:flutter/material.dart';
import 'package:ghasedak/pages/channel/presentation/pages/channel.dart';

class ChannelItem extends StatefulWidget {
  final int id;
  final String title;
  final String datetime;
  const ChannelItem(this.id, this.title, this.datetime, {super.key});

  @override
  State<ChannelItem> createState() => _ChannelItemState();
}

class _ChannelItemState extends State<ChannelItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              ChannelPage.pageRoute,
              arguments: {"title": widget.title, "id": widget.id},
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(widget.datetime),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
        )
      ]),
    );
  }
}

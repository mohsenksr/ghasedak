import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghasedak/pages/channel/data/models/post.dart';
import 'package:ghasedak/pages/channel/domain/channel_cubit.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_subscription.dart';
import 'package:ghasedak/pages/channel_info/domain/channel_info_cubit.dart';

class ShowPostWidget extends StatefulWidget {
  final String contentTextOrLink;
  final PostType type;
  ShowPostWidget(this.contentTextOrLink, this.type, {super.key});

  @override
  State<ShowPostWidget> createState() => _ShowPostWidgetState();
}

class _ShowPostWidgetState extends State<ShowPostWidget> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Center(child: 
        widget.type == PostType.IMAGE ?
        CachedNetworkImage(
        imageUrl: widget.contentTextOrLink,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
        height: 200,
     )
        :
        Text(widget.contentTextOrLink))],
      ),
    );
  }
}

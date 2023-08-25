import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghasedak/pages/channel/data/models/post.dart';
import 'package:ghasedak/pages/channel/domain/channel_cubit.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_subscription.dart';
import 'package:ghasedak/pages/channel_info/domain/channel_info_cubit.dart';

class AddPostWidget extends StatefulWidget {
  final int channelId;
  final ChannelCubit channelCubit;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  AddPostWidget(this.channelId, this.channelCubit, {super.key});

  @override
  State<AddPostWidget> createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  PostType? type = PostType.TEXT;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: MultiBlocProvider(
        providers: [
          BlocProvider<ChannelCubit>.value(
            value: widget.channelCubit,
          ),
        ],
        child: BlocConsumer<ChannelCubit, ChannelState>(
            listener: (context, state) {
          if (state is ChannelNewPostAddedState) {
            Navigator.of(context).pop();
          }
        }, builder: (context, state) {
          if (state is ChannelLoadingState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [Center(child: CircularProgressIndicator())],
            );
          }
          if (state is ChannelAddFileState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: widget.textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'متن',
                  ),
                ),
                Container(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pop();

                    widget.channelCubit.AddContentText(widget.channelId,
                        state.contentId, widget.textController.text);
                  },
                  child: Text("افزودن پست"),
                ),
              ],
            );
          }
          if (state is ChannelErrorState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [Center(child: Text("Error"))],
            );
          }
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: widget.priceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'قیمت به تومان',
                  ),
                ),
                Container(height: 30),
                TextField(
                  controller: widget.summaryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'خلاصه',
                  ),
                ),
                Container(height: 30),
                DropdownButton<PostType>(
                  items: PostType.values.map((PostType type) {
                    return DropdownMenuItem<PostType>(
                      value: type,
                      child: Text(type.stringMode),
                    );
                  }).toList(),
                  value: type,
                  onChanged: (value) {
                    setState(() {
                      type = value;
                    });
                  },
                ),
                Container(height: 30),
                ElevatedButton(
                  onPressed: () {
                    widget.channelCubit.AddContent(
                      widget.channelId,
                      type!,
                      int.parse(widget.priceController.text),
                      widget.summaryController.text,
                    );
                  },
                  child: Text("افزودن پست"),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

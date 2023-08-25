import 'package:flutter/material.dart';
import 'package:ghasedak/pages/channel_info/data/models/channel_subscription.dart';
import 'package:ghasedak/pages/channel_info/domain/channel_info_cubit.dart';

class CreateSubscriptionWidget extends StatefulWidget {
  final ChannelInfoCubit channelInfoCubit;
  final ChannelInfoShowState state;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController percentController = TextEditingController();
  CreateSubscriptionWidget(this.channelInfoCubit, this.state, {super.key});

  @override
  State<CreateSubscriptionWidget> createState() =>
      _CreateSubscriptionWidgetState();
}

class _CreateSubscriptionWidgetState extends State<CreateSubscriptionWidget> {
  SubscriptionDuration? duration = SubscriptionDuration.ONE_MONTH;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
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
            DropdownButton<SubscriptionDuration>(
              items: SubscriptionDuration.values.map((SubscriptionDuration duration) {
                return DropdownMenuItem<SubscriptionDuration>(
                  value: duration,
                  child: Text(duration.persianString),
                );
              }).toList(),
              value: duration,
              onChanged: (value) {
                setState(() {
                  duration = value;
                });
              },
            ),
            Container(height: 30),
            ElevatedButton(
              onPressed: () {
                widget.channelInfoCubit.createSubscription(
                  widget.state.description.id,
                  int.parse(widget.priceController.text),
                  duration!,
                );
                Navigator.of(context).pop();
              },
              child: Text("افزودن مدیر"),
            ),
          ],
        ),
      ),
    );
  }
}

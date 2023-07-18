import 'package:flutter/material.dart';

class SubscriptionItem extends StatefulWidget {
  final int id;
  final String name;
  final int price;
  const SubscriptionItem(this.id, this.name, this.price, {super.key});

  @override
  State<SubscriptionItem> createState() => _SubscriptionItemState();
}

class _SubscriptionItemState extends State<SubscriptionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(widget.price.toString() + " تومان"),
                    Container(
                      width: 10,
                    ),
                    Icon(Icons.edit),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 1,
        )
      ]),
    );
  }
}

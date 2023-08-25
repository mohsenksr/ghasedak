import 'package:flutter/material.dart';

class SubscriptionItem extends StatefulWidget {
  final int id;
  final String name;
  final int price;
  final bool adminMode;
  final VoidCallback? buyCallback;
  const SubscriptionItem(this.id, this.name, this.price,
      {this.adminMode = true, this.buyCallback, super.key});

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
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: [
                  Text(widget.price.toString() + " تومان"),
                  Container(
                    width: 10,
                  ),
                  widget.adminMode
                      ? InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.edit)),
                        )
                      : ElevatedButton(
                          onPressed: widget.buyCallback,
                          child: Text("خرید"),
                        ),
                ],
              ),
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

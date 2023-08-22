import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  final String id;
  final String name;
  final int? percent;
  const UserItem(this.id, this.name, {super.key, this.percent});

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
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
              widget.percent == null
                  ? Container()
                  : InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(widget.percent!.toString() + "%"),
                          Container(width: 10,),
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

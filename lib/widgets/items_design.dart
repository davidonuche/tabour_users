import 'package:flutter/material.dart';
import 'package:tabour_users/mainscreens/item_detail_screen.dart';
import 'package:tabour_users/mainscreens/items_screen.dart';
import 'package:tabour_users/models/items.dart';
import 'package:tabour_users/models/sellers.dart';

class ItemsDesign extends StatefulWidget {
  Items? model;
  BuildContext context;
  ItemsDesign({required this.model, required this.context});

  @override
  State<ItemsDesign> createState() => _SellersDesignState();
}

class _SellersDesignState extends State<ItemsDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ItemDetailsScreen(
              model: widget.model,
            ),
          ),
        );
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 275,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.thumbnailUrl!,
                height: 210.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                widget.model!.title!,
                style: const TextStyle(
                    color: Colors.cyan, fontSize: 20, fontFamily: "Train"),
              ),
              Text(
                widget.model!.shortInfo!,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

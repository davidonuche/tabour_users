import 'package:flutter/material.dart';
import 'package:tabour_users/mainscreens/items_screen.dart';
import 'package:tabour_users/models/menus.dart';

class MenusDesign extends StatefulWidget {
  Menus? model;
  BuildContext context;
  MenusDesign({super.key, required this.model, required this.context});

  @override
  State<MenusDesign> createState() => _MenusDesignState();
}

class _MenusDesignState extends State<MenusDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ItemsScreen(model: widget.model)
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
                widget.model!.menuTitle!,
                style: const TextStyle(
                    color: Colors.cyan, fontSize: 20, fontFamily: "Train"),
              ),
              Text(
                widget.model!.menuInfo!,
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

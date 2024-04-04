import 'package:flutter/material.dart';
import 'package:tabour_users/mainscreens/menus_screen.dart';
import 'package:tabour_users/models/sellers.dart';

class SellersDesign extends StatefulWidget {
  Sellers? model;
  BuildContext context;
  SellersDesign({super.key, required this.model, required this.context});

  @override
  State<SellersDesign> createState() => _SellersDesignState();
}

class _SellersDesignState extends State<SellersDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => MenusScreen(
              model: widget.model
            )
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
                widget.model!.sellerAvatarUrl!,
                height: 210.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                widget.model!.sellerName!,
                style: const TextStyle(
                    color: Colors.cyan, fontSize: 20, fontFamily: "Train"),
              ),
              Text(
                widget.model!.sellerEmail!,
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

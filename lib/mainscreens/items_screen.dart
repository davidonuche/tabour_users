import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/sliver.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:tabour_users/global/global.dart';
import 'package:tabour_users/models/items.dart';
import 'package:tabour_users/models/menus.dart';
import 'package:tabour_users/models/sellers.dart';
import 'package:tabour_users/widgets/items_design.dart';
import 'package:tabour_users/widgets/menus_design.dart';
import 'package:tabour_users/widgets/sellers_design.dart';
import 'package:tabour_users/widgets/progress_bar.dart';
import 'package:tabour_users/widgets/text_widget_header.dart';
import 'package:tabour_users/widgets/user_drawer.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key, Sellers? model});

  @override
  State<ItemsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const UserDrawer(),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.amber,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: const Text(
            "Tabour Users",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Lobster",
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                // send user to cart screen
              },
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
            ),
           const  Positioned(
                child: Stack(children: [
              Icon(
                Icons.brightness_1,
                size: 20,
                color: Colors.green,
              ), 
              Positioned(
                top: 3.0,
                right: 4.0,
                child: Center(
                  child: Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
                )
              ),
            ]))
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: TextWidgetHeader(title: ""),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("sellers")
                  .doc(sharedPreferences!.getString("uid"))
                  .collection("menus")
                  .orderBy("publishedDate", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: circularProgress(),
                        ),
                      )
                    : SliverStaggeredGrid.countBuilder(
                        crossAxisCount: 1,
                        staggeredTileBuilder: (c) => const StaggeredTile.fit(1),
                        itemBuilder: (context, index) {
                          Items model = Items.fromJson(
                            snapshot.data!.docs[index].data()!
                                as Map<String, dynamic>,
                          );
                          return ItemsDesign(
                            model: model,
                            context: context,
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                      );
              },
            ),
          ],
        ));
  }
}

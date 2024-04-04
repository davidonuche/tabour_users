import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/sliver.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:tabour_users/assistantmethods/assistant_methods.dart';
import 'package:tabour_users/models/menus.dart';
import 'package:tabour_users/models/sellers.dart';
import 'package:tabour_users/splash%20screen/spalsh_screen.dart';
import 'package:tabour_users/widgets/menus_design.dart';
import 'package:tabour_users/widgets/progress_bar.dart';
import 'package:tabour_users/widgets/text_widget_header.dart';


class MenusScreen extends StatefulWidget {
  final Sellers? model;
  const MenusScreen({super.key, required this.model});

  @override
  State<MenusScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MenusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            )),
          ),
          leading: IconButton(
            onPressed: () {
              clearCartNow(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => const SplashScreen()),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Tabour Users",
            style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: TextWidgetHeader(
                  title: widget.model!.sellerName.toString() + " Menus"),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("sellers")
                  .doc(widget.model!.sellerUID)
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
                          Menus model = Menus.fromJson(
                            snapshot.data!.docs[index].data()!
                                as Map<String, dynamic>,
                          );
                          return MenusDesign(
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

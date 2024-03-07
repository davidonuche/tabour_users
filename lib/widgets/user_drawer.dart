import 'package:flutter/material.dart';
import 'package:tabour_users/global/global.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // hearder drawer
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 160,
                      width: 160,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            sharedPreferences!.getString("photoUrl")!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  sharedPreferences!.getString("name")!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: "Train",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

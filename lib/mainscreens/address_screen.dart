import 'package:flutter/material.dart';
import 'package:tabour_users/mainscreens/save_address_screen.dart';
import 'package:tabour_users/widgets/simple_app_bar.dart';

class AddressScreen extends StatefulWidget {
  final double totalAmount;
  final String sellerUID;
  const AddressScreen(
      {Key? key, required this.totalAmount, required this.sellerUID})
      : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // save address to user collection
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SaveAddressScreen(),
            ),
          );
        },
        label: const Text('Add New Address'),
        backgroundColor: Colors.cyan,
        icon: const Icon(Icons.add_location),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Text(
                "Select Address: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

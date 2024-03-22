import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tabour_users/assistantmethods/cart_item_counter.dart';
import 'package:tabour_users/global/global.dart';

separateItemIDs() {
  List<String> separatedItemIDsList = [], defaultItemList = [];
  int i = 0;
  defaultItemList = sharedPreferences!.getStringList("userCart")!;
  for (i; i < defaultItemList.length; i++) {
    String item = defaultItemList[i].toString();
    var pos = item.indexOf(":");
    String getItemId = (pos != -1) ? item.substring(0, pos) : item;
    print("\nThis is itemID now = " + getItemId);
    separatedItemIDsList.add(getItemId);
  }
  print("\nThis is Items List now =");
  print(separatedItemIDsList);
  return separatedItemIDsList;
}

addItemToCart(String? foodItemId, BuildContext context, int itemCounter) {
  List<String>? tempList = sharedPreferences!.getStringList("userCart");
  tempList!.add(foodItemId! + ":$itemCounter"); // 56557657:7

  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .update({
    "userCart": tempList,
  }).then((value) {
    Fluttertoast.showToast(msg: "Item added to cart successfully.");
    sharedPreferences!.setStringList("userCart", tempList);

    // update the badge
    Provider.of<CartItemCounter>(context, listen: false)
        .displayCartListItemsNumber();
  });
}

separateItemQuantities() {
  List<int> separateItemQuantitiesList = [];
  List<String> defaultItemList = [];
  int i = 1;
  defaultItemList = sharedPreferences!.getStringList("userCart")!;
  for (i; i < defaultItemList.length; i++) {
    // 56557657:7
    String item = defaultItemList[i].toString();
    // 7
    List<String> listItemCharacters = item.split(":").toList();

    var quanNumber = int.parse(listItemCharacters[1].toString());

    print("\nThis is Quantity Number = " + quanNumber.toString());

    separateItemQuantitiesList.add(quanNumber);
  }
  print("\nThis is Quantity List now =");
  print(separateItemQuantitiesList);

  return separateItemQuantitiesList;
}

clearCartNow(context) {
  sharedPreferences!.setStringList('userCart', ["garbageValue"]);
  List<String>? emptyList = sharedPreferences!.getStringList("userCart");
  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .update({
    "userCart": emptyList,
  }).then(
    (value) {
      sharedPreferences!.setString('userCart', emptyList!.toString());
      Provider.of<CartItemCounter>(context, listen: false)
          .displayCartListItemsNumber();
    },
  );
}

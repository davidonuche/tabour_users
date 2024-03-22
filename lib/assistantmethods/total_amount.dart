import 'package:flutter/material.dart';

class TotalAmount extends ChangeNotifier {
  double totalAmount = 0;

  double get tAmount => totalAmount;

  displayTotalAmount(double number) async {
    totalAmount = number;
    await Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }
}
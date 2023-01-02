import 'package:flutter/material.dart';

class CardModel extends ChangeNotifier {
  //list of Items on sale

  final List<Map<String, dynamic>> _shopItems = [
    //[itemName, itemPrice, imagepath, color]
    {
      "name": "Avocado",
      "price": "5.00",
      "image": "images/avocado.png",
      "colour": Colors.blue
    },
    {
      "name": "Banana",
      "price": "12.00",
      "image": "images/banana.png",
      "colour": Colors.yellow
    },
    {
      "name": "Cherry",
      "price": "2.00",
      "image": "images/cherry.png",
      "colour": Colors.orangeAccent
    },
    {
      "name": "Watermelon",
      "price": "5.00",
      "image": "images/watermelon.png",
      "colour": Colors.greenAccent
    },
  ];

  //List of cartItems
  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  //dd Items to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove items from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (var i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i]["price"]);
    }

    return totalPrice.toStringAsFixed(2);
  }
}

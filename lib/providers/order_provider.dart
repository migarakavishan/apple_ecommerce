import 'package:apple_ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}

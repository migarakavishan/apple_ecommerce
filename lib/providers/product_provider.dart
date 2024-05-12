import 'dart:io';

import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  final TextEditingController _priceController = TextEditingController();
  TextEditingController get priceController => _priceController;

  final TextEditingController _quantityController = TextEditingController();
  TextEditingController get quantityController => _quantityController;

  String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;

  void setSelectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}

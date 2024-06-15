import 'dart:io';

import 'package:apple_ecommerce/controllers/product_controller.dart';
import 'package:apple_ecommerce/controllers/stroage_controller.dart';
import 'package:apple_ecommerce/models/product_model.dart';
import 'package:apple_ecommerce/utils/custom_dialog.dart';
import 'package:apple_ecommerce/utils/custom_image_picker.dart';
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

  int _selectedQuantity = 1;
  int get selectedQuantity => _selectedQuantity;

  Product? _selectedProduct;
  Product? get selectedProduct => _selectedProduct;

  List<Product> _products = [];
  List<Product> get products => _products;

  void setProduct(List<Product> productData) {
    _products = productData;
    notifyListeners();
  }

  void setSelectedProduct(Product product) {
    _selectedProduct = product;
    _selectedQuantity = 1;
    notifyListeners();
  }

  void incrementQuantity() {
    if (_selectedQuantity < _selectedProduct!.quantity) {
      _selectedQuantity++;
      notifyListeners();
    }
  }

  void decrementQuantity() {
    if (_selectedQuantity != 1) {
      _selectedQuantity--;
      notifyListeners();
    }
  }

  void setSelectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> pickProductImage() async {
    _pickedImage = await CustomImagePicker().pickImage();
    notifyListeners();
  }

  Future<void> startAddProduct(BuildContext context) async {
    if (_pickedImage == null) {
      CustomDialog.showDialog(context,
          title: 'Please try again',
          content: 'Please select your product image');
    } else if (_nameController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Please try again',
          content: 'Please insert your product name');
    } else if (_descriptionController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Please try again',
          content: 'Please insert your product description');
    } else if (_priceController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Please try again',
          content: 'Please insert your product price');
    } else if (_quantityController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Please try again',
          content: 'Please enter your product quantity');
    } else if (_selectedCategory == null) {
      CustomDialog.showDialog(context,
          title: 'Please try again', content: 'Please select product category');
    } else {
      CustomDialog.showLoader();
      String imageUrl = await StorageController.uploadImage(
          _pickedImage!, 'Product Images/$_selectedCategory');
      Product product = Product(
          image: imageUrl,
          price: double.parse(_priceController.text),
          description: _descriptionController.text,
          name: _nameController.text,
          quantity: int.parse(_quantityController.text),
          category: _selectedCategory!);

      if (context.mounted) {
        ProductController().addProduct(product, context);
      }
    }
  }

  void clearProductData() {
    _pickedImage = null;
    _nameController.clear();
    _descriptionController.clear();
    _priceController.clear();
    _quantityController.clear();
    _selectedCategory = null;
    notifyListeners();
  }
}

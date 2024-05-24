import 'package:apple_ecommerce/models/product_model.dart';
import 'package:apple_ecommerce/providers/product_provider.dart';
import 'package:apple_ecommerce/utils/custom_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProductController {
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Products');

  Future<void> addProduct(Product product, BuildContext context) async {
    try {
      String productID = productCollection.doc().id;
      product.id = productID;
      productCollection.doc(productID).set(product.toJson()).then((value) {
        Provider.of<ProductProvider>(context, listen: false).clearProductData();
        CustomDialog.dismissLoader();
        CustomDialog.showDialog(context,
            title: 'Product Added', content: 'Your product added to the store');
      });
    } catch (e) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong', content: 'Please Try again');
      CustomDialog.dismissLoader();
    }
  }

  Future<List<Product>> fetchAllProducts() async {
    List<Product> products = [];
    final data = await productCollection.get();
    final productMapList = data.docs;

    for (var product in productMapList) {
      Product item = Product.fromJson(product.data() as Map<String, dynamic>);
      products.add(item);
    }
    return products;
  }
}

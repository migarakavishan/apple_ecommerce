import 'package:apple_ecommerce/models/product_model.dart';
import 'package:apple_ecommerce/providers/product_provider.dart';
import 'package:apple_ecommerce/providers/user_provider.dart';
import 'package:apple_ecommerce/utils/custom_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';

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

  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    List<Product> products = [];
    final data = await productCollection.get();
    final productMapList = data.docs;
    UserModel? user;
    if (context.mounted) {
      user = Provider.of<UserProvider>(context, listen: false).user!;
    }

    for (var product in productMapList) {
      Product item = Product.fromJson(product.data() as Map<String, dynamic>);
      products.add(item);
    }
    if (context.mounted) {
      Provider.of<ProductProvider>(context, listen: false).setProduct(products);
    }
    List<Product> favProducts = [];
    for (var product in products) {
      for (var fItem in user!.favorite!) {
        if (product.id! == fItem) {
          favProducts.add(product);
        }
      }
    }
    if (context.mounted) {
      Provider.of<ProductProvider>(context, listen: false)
          .setFavoriteProducts(favProducts);
    }
    Logger().f(favProducts.length);
    return products;
  }

  Future<List<Product>> fetchSelectedCategory(String category) async {
    List<Product> products = [];
    final data =
        await productCollection.where('category', isEqualTo: category).get();
    final productMapList = data.docs;

    for (var product in productMapList) {
      Product item = Product.fromJson(product.data() as Map<String, dynamic>);
      products.add(item);
    }

    return products;
  }
}

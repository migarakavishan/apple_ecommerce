import 'package:apple_ecommerce/providers/product_provider.dart';
import 'package:apple_ecommerce/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../product_view/product_view.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            'Favorite Items',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
          return productProvider.favouriteProducts.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/not_found.png'),
                      const Text(
                        "No Favorite items",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: productProvider.favouriteProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.92,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      final products = productProvider.favouriteProducts;
                      return GestureDetector(
                        onTap: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .setSelectedProduct(products[index]);
                          CustomNavigator.push(
                              context,
                              ProductView(
                                product: products[index],
                              ));
                        },
                        child: SizedBox(
                          height: 200,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Hero(
                                  tag: products[index].id.toString(),
                                  child: Image.network(
                                    products[index].image,
                                    height: 150,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      products[index].name,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'LKR ${products[index].price}',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        }));
  }
}

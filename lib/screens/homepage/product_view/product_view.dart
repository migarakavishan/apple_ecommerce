import 'package:apple_ecommerce/models/product_model.dart';
import 'package:apple_ecommerce/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/order_provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Consumer<ProductProvider>(builder: (context, productProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Stack(
                    children: [
                      const SafeArea(
                          child: BackButton(
                        color: Colors.white,
                      )),
                      SafeArea(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {},
                              iconSize: 30,
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.grey.shade600)),
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Hero(
                            tag: product.id.toString(),
                            child: Image(
                              image: NetworkImage(product.image),
                              height: size.height * 0.3,
                            ),
                          )),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            product.name,
                            style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LKR ${product.price}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Overview',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800),
                      ),
                      Text(
                        product.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '(${product.quantity} Items Acailable)',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 140,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                productProvider.decrementQuantity();
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.shade700,
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              productProvider.selectedQuantity.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            GestureDetector(
                              onTap: () {
                                productProvider.incrementQuantity();
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.shade700,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
          Consumer<OrderProvider>(builder: (context, orderProvider, child) {
            return Positioned(
              bottom: 8,
              left: 1,
              right: 1,
              child: GestureDetector(
                onTap: () {
                  if (orderProvider.cartItems.contains(product)) {
                    orderProvider.removeFromCart(product);
                  } else {
                    orderProvider.addToCart(product);
                  }
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width * 0.85,
                      height: 60,
                      decoration: BoxDecoration(
                          color: orderProvider.cartItems.contains(product)
                              ? Colors.red.shade900
                              : Colors.green.shade900,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        orderProvider.cartItems.contains(product)
                            ? 'Remove From Cart'
                            : 'Add to Cart',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    )),
              ),
            );
          })
        ],
      ),
    );
  }
}

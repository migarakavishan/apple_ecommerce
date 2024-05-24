import 'package:apple_ecommerce/controllers/product_controller.dart';
import 'package:apple_ecommerce/models/product_model.dart';
import 'package:apple_ecommerce/providers/product_provider.dart';
import 'package:apple_ecommerce/screens/homepage/product_view/product_view.dart';
import 'package:apple_ecommerce/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'The latest.',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        const Text(
          'Take a look at what’s new, right now.',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        FutureBuilder(
            future: ProductController().fetchAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircleAvatar();
              }
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              List<Product> products = snapshot.data!;
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.92,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) {
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
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'LKR ${products[index].price}',
                                  style: const TextStyle(color: Colors.grey),
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
              );
            }),
      ],
    );
  }
}

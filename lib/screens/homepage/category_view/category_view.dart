import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/product_controller.dart';
import '../../../models/product_model.dart';
import '../../../providers/product_provider.dart';
import '../../../utils/custom_navigator.dart';
import '../product_view/product_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          category,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future:
                ProductController().fetchSelectedCategory(category),
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
      ),
    );
  }
}

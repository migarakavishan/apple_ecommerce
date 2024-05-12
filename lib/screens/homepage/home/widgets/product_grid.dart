import 'package:flutter/material.dart';

import '../../../../data/demo_data.dart';

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
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: DemoData.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.92,
              crossAxisSpacing: 15,
              mainAxisSpacing: 5),
          itemBuilder: (context, index) {
            return SizedBox(
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
                    child: Image.network(
                      DemoData.products[index].image,
                      height: 150,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DemoData.products[index].name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          '\$ ${DemoData.products[index].price}',
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
            );
          },
        ),
      ],
    );
  }
}

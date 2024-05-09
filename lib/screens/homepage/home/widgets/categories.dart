import 'package:apple_ecommerce/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/demo_data.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Hello ${userProvider.user!.name}',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade800),
          ),
          const Text(
            'Apple Store',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          const Text(
            'The best way to buy the products you love.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(
                  DemoData.categories.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: 120,
                          height: 100,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 120,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade700,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  children: [
                                    Image.asset(
                                        DemoData.categories[index].image),
                                    Text(
                                      DemoData.categories[index].name,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
            ),
          ),
        ],
      );
    });
  }
}

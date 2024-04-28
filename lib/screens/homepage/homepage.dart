import 'package:apple_ecommerce/data/demo_data.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_app_bar.dart';
import 'widgets/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const SizedBox(
              height: 8,
            ),
            NewSlider(size: size),
            const SizedBox(
              height: 10,
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
              child: Row(
                children: List.generate(
                    DemoData.categories.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: 120,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade700,
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                        style: const TextStyle(
                                            color: Colors.white),
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
        ),
      )),
    );
  }
}

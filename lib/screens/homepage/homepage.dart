import 'package:apple_ecommerce/data/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/categories.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 8,
              ),
              NewSlider(size: size),
              const Categories(),
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
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: DemoData.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.network(
                              DemoData.products[index].image,
                              width: size.width * 0.3,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

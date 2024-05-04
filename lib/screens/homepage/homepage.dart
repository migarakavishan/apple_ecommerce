import 'package:flutter/material.dart';

import 'widgets/categories.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/product_grid.dart';
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
              const ProductGrid()
            ],
          ),
        ),
      )),
    );
  }
}

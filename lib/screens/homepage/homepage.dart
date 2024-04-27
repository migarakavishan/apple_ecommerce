import 'package:apple_ecommerce/data/demo_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_app_bar.dart';

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
          children: [
            const CustomAppBar(),
            CarouselSlider(
              options: CarouselOptions(height: 160.0),
              items: DemoData.sliderImages.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: size.width,
                      height: 160,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      )),
    );
  }
}

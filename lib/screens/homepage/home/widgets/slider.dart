import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../data/demo_data.dart';

class NewSlider extends StatelessWidget {
  const NewSlider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(aspectRatio: 16 / 7, autoPlay: true),
      items: DemoData.sliderImages.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                width: size.width,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(url))),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
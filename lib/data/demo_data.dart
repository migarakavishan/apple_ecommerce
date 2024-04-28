import 'package:apple_ecommerce/models/category_model.dart';

class DemoData {
  static List<String> sliderImages = [
    'https://images.fonearena.com/blog/wp-content/uploads/2022/01/Apple-device-lineup-1024x501.jpg',
    'https://i.insider.com/65551ac236d588dc55d10eca?width=700',
    'https://static1.makeuseofimages.com/wordpress/wp-content/uploads/2022/09/packed-apple-products.jpg',
    'https://miro.medium.com/v2/resize:fit:1400/1*4YPFKvB-wC2LUmhG4zwahQ.jpeg'
  ];

  static List<CategoryModel> categories = [
    CategoryModel(image: 'assets/images/mac.png', name: 'Mac'),
    CategoryModel(image: 'assets/images/ipad.png', name: 'i Pad'),
    CategoryModel(image: 'assets/images/iphone.png', name: 'i Phone'),
    CategoryModel(image: 'assets/images/watch.png', name: 'Watch'),
    CategoryModel(image: 'assets/images/airpods.png', name: 'AirPods'),
  ];
}

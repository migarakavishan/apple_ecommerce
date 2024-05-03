import 'package:apple_ecommerce/models/category_model.dart';
import 'package:apple_ecommerce/models/product_model.dart';

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

  static List<Product> products = [
    Product(
        image:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone15pro-digitalmat-gallery-3-202309?wid=728&hei=666&fmt=png-alpha&.v=1693081542150',
        title: 'iPhone 15 Pro',
        price: 999),
    Product(
        image:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone13-digitalmat-gallery-3-202203?wid=728&hei=666&fmt=png-alpha&.v=1644988765122',
        title: 'iPhone 13',
        price: 860),
    Product(
        image:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphonese-digitalmat-gallery-3-202203?wid=728&hei=666&fmt=png-alpha&.v=1644987579761',
        title: 'iPhone SE',
        price: 430),
    Product(
        image:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone14-digitalmat-gallery-3-202209?wid=728&hei=666&fmt=png-alpha&.v=1662055813794',
        title: 'iPhone 14',
        price: 700),
    Product(
        image:
            'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone15-digitalmat-gallery-4-202309?wid=728&hei=666&fmt=png-alpha&.v=1693011169045',
        title: 'iPhone 15',
        price: 800),
  ];
}

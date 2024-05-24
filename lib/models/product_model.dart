class Product {
  String image;
  String name;
  String description;
  double price;
  int quantity;
  String category;
  String? id;

  Product(
      {required this.image,
      required this.name,
      required this.price,
      required this.description,
      required this.category,
      required this.quantity,
      this.id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        image: json['image'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        quantity: json['quantity'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'description': description,
      'category': category,
      'quantity': quantity,
      'id': id
    };
  }
}

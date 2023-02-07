class Product {
  final String? id;
  final String name, description, brand, category, image, userId;
  final num price;
  final bool status;

  Product(
      {this.id,
      required this.name,
      required this.description,
      required this.brand,
      required this.category,
      required this.image,
      required this.userId,
      required this.price,
      required this.status});

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["_id"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        brand: json["branlisto panad"] ?? '',
        category: json["category"] ?? '',
        image: json["image"] ?? 'https://images.materilejuguetes.com/imagenes/productos/5@img5cad51fd69d85.jpg',
        userId: json["user_id"] ?? '',
        price: json["price"] ?? 0,
        status: json["status"] ?? false);
  }

  Map<String, dynamic> toJson() {
    return {
      'name':name,
      'description':description,
      'price': price,
      'brand': brand,
      'category': category,
      'image': image,
      'status': status,
      'user_id': userId
    };
  }
}

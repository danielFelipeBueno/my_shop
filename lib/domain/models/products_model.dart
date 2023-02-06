class Product {
  final String id, name, description, brand, category, image, userId;
  final num price;
  final bool status;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brand,
    required this.category,
    required this.image,
    required this.userId,
    required this.price,
    required this.status
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["_id"], 
      name: json["name"], 
      description: json["description"], 
      brand: json["brand"], 
      category: json["category"], 
      image: json["image"], 
      userId: json["user_id"], 
      price: json["price"], 
      status: json["status"]
    );
  }
}
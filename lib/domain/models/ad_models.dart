class Ad {
  final String id, name, description, brand, category, image, userId;
  final num discount;
  final bool status;

  Ad({
    required this.id,
    required this.name,
    required this.description,
    required this.brand,
    required this.category,
    required this.image,
    required this.userId,
    required this.discount,
    required this.status
  });

  static Ad fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json["_id"], 
      name: json["name"], 
      description: json["description"], 
      brand: json["brand"], 
      category: json["category"], 
      image: json["image"], 
      userId: json["user_id"], 
      discount: json["discount"], 
      status: json["status"]
    );
  }
}
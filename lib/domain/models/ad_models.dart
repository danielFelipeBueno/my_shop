class Ad {
  final String? id;
  final String name, description, brand, category, image, userId;
  final num discount;
  final bool status;

  Ad({
    this.id,
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
      id: json["_id"] ?? '', 
      name: json["name"]?? '', 
      description: json["description"]?? '', 
      brand: json["brand"] ?? '', 
      category: json["category"] ?? '', 
      image: json["image"] ?? '', 
      userId: json["user_id"] ?? '',
      discount: json["discount"] ?? 0, 
      status: json["status"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name':name,
      'description':description,
      'discount': discount,
      'brand': brand,
      'category': category,
      'image': image,
      'status': status,
      'user_id': userId
    };
  }
}
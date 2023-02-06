
class User {
  final String id, firstName, lastName, urlProfile, email;
  final int age;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.urlProfile,
    required this.email
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      age: json["age"],
      urlProfile: json["url_profile"],
      email: json["email"]
    );
  }
}
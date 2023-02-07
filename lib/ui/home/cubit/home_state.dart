part of 'home_cubit.dart';

class HomeState {
  final int index;
  final User? user;
  final Ad? ad;
  final List<Product> products;
  final TextEditingController urlController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController ageController;

  HomeState(
    this.urlController,
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.ageController,{
    this.index = 0, 
    this.user, 
    this.ad, 
    this.products = const []
  });

  HomeState copyWith({
    int? index, 
    User? user, 
    Ad? ad, 
    List<Product>? products,
    TextEditingController? urlController,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? emailController,
    TextEditingController? ageController,
  }) {
    return HomeState(
      urlController ?? this.urlController,
      firstNameController ?? this.firstNameController,
      lastNameController ?? this.lastNameController,
      emailController ?? this.emailController,
      ageController ?? this.ageController,
        index: index ?? this.index,
        user: user ?? this.user,
        ad: ad ?? this.ad,
        products: products ?? this.products);
  }
}

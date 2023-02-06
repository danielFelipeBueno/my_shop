part of 'admin_cubit.dart';

class AdminState {
  final PageController controller;
  final List<Product> products;
  final List<Ad> ads;

  AdminState(
    this.controller,{
    this.products = const[],
    this.ads = const[]
  });

  AdminState copyWith({
    PageController? controller,
    List<Product>? products,
    List<Ad>? ads
  }){
    return AdminState(
      controller ?? this.controller,
      products: products?? this.products,
      ads: ads?? this.ads
    );
  }
}

part of 'home_cubit.dart';

class HomeState {
  final int index;
  final User? user;
  final Ad? ad;
  final List<Product> products;

  HomeState({
    this.index = 0,
    this.user,
    this.ad,
    this.products = const[]
  });

  HomeState copyWith({
    int? index,
    User? user,
    Ad? ad,
    List<Product>? products
  }){
    return HomeState(
      index: index ?? this.index,
      user: user?? this.user,
      ad: ad?? this.ad,
      products: products ?? this.products
    );
  }
}


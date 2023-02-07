part of 'shopping_cart_cubit.dart';

class ShoppingCartState {
  final List<Product> products;
  final num total;

  ShoppingCartState({
    this.products = const [],
    this.total = 0.0
  });

  ShoppingCartState copyWith({
    List<Product>? products,
    num? total
  }) {
    return ShoppingCartState(
      products: products ?? this.products,
      total: total ?? this.total
    );
  }
}

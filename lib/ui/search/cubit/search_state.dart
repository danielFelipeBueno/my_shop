part of 'search_cubit.dart';

class SearchState {
  final List<Product> products;

  SearchState({
    this.products = const[]
  });

  SearchState copyWith({
    List<Product>? products
  }) => SearchState(
    products: products ?? this.products
  );
}

import 'package:bloc/bloc.dart';
import 'package:my_shop/domain/models/products_model.dart';

part 'shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit() : super(ShoppingCartState());

  void addProduct(Product product) {
    List<Product> products = List.from(state.products);
    products.add(product);
    num total = state.total;
    total += product.price;
    ShoppingCartState newState = state.copyWith(
      products: products, 
      total: total
    );
    emit(newState);
  }

  void removeProduct(int index) {
    List<Product> products = List.from(state.products);
    num total = state.total;
    total -= state.products[index].price;
    products.removeAt(index);
    ShoppingCartState newState = state.copyWith(
      products: products,
      total: total
    );
    emit(newState);
  }
}

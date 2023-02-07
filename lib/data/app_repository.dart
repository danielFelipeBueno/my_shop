import 'package:http/http.dart';
import 'package:my_shop/domain/models/products_model.dart';

abstract class AppRepository {
  Future<Response> getUserById(String userId);
  Future<Response> getMainProducts(String userId);
  Future<Response> getMainAds(String userId);
  Future<Response> getHome();
  Future<Response> createProduct(Product product);
}

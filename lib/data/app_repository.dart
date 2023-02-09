import 'package:http/http.dart';
import 'package:my_shop/domain/models/ad_models.dart';
import 'package:my_shop/domain/models/products_model.dart';

abstract class AppRepository {
  Future<Response> getUserById(String userId);
  Future<Response> getMainProducts(String userId);
  Future<Response> getMainAds(String userId);
  Future<Response> getHome();
  Future<Response> createProduct(Product product);
  Future<Response> createAd(Ad ad);
  Future<Response> search(String query);
}

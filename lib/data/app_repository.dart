import 'package:http/http.dart';

abstract class AppRepository {
  Future<Response> getUserById(String userId);
  Future<Response> getMainProducts(String userId);
  Future<Response> getMainAds(String userId);
  Future<Response> getHome();
}
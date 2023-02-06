

import 'package:my_shop/data/app_repository.dart';
import 'package:http/http.dart' as http;
import 'package:my_shop/utils/backend_settings.dart';

class AppImpl extends AppRepository {
  @override
  Future<http.Response> getUserById(String userId) async {
    final url = Uri.parse(getUserByIdUrl+userId);
    return await http.get(url);
  }
  @override
  Future<http.Response> getMainProducts(String userId) async {
    final url = Uri.parse(getMainProductsUrl+userId);
    return await http.get(url);
  }
  @override
  Future<http.Response> getMainAds(String userId) async {
    final url = Uri.parse(getMainAdsUrl+userId);
    return await http.get(url);
  }
  @override
  Future<http.Response> getHome() async {
    final url = Uri.parse(getMainHomeUrl);
    return await http.get(url);
  }
}
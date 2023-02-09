import 'dart:developer';

import 'package:my_shop/data/app_repository.dart';
import 'package:http/http.dart' as http;
import 'package:my_shop/domain/models/ad_models.dart';
import 'dart:convert';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/utils/backend_settings.dart';

class AppImpl extends AppRepository {
  @override
  Future<http.Response> getUserById(String userId) async {
    final url = Uri.parse(getUserByIdUrl + userId);
    return await http.get(url);
  }

  @override
  Future<http.Response> getMainProducts(String userId) async {
    final url = Uri.parse(getMainProductsUrl + userId);
    return await http.get(url);
  }

  @override
  Future<http.Response> getMainAds(String userId) async {
    final url = Uri.parse(getMainAdsUrl + userId);
    return await http.get(url);
  }

  @override
  Future<http.Response> getHome() async {
    final url = Uri.parse(getMainHomeUrl);
    return await http.get(url);
  }

  @override
  Future<http.Response> createProduct(Product product) async {
    final url = Uri.parse(createProductUrl);
    final body = jsonEncode(product.toJson());
    final headers = {'Content-Type': 'application/json'};
    return await http.post(url, headers: headers, body: body);
  }

  @override
  Future<http.Response> createAd(Ad ad) async {
    final url = Uri.parse(createAdUrl);
    final body = jsonEncode(ad.toJson());
    final headers = {'Content-Type': 'application/json'};
    return await http.post(url, headers: headers, body: body);
  }

  @override
  Future<http.Response> search(String query) async {
    final url = Uri.parse(searchUrl+query);
    return await http.get(url);
  }
}

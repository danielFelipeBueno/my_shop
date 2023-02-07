import 'dart:convert';
import 'dart:developer';

import 'package:my_shop/data/app_repository.dart';
import 'package:my_shop/domain/models/ad_models.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/domain/models/user_model.dart';

class AppUseCase {
  final AppRepository _appRepository;

  AppUseCase(this._appRepository);

  Future<User?> getUserById(String userId) async {
    final userResponse = await _appRepository.getUserById(userId);
    // inspect(userResponse);
    if (userResponse.statusCode != 200) {}

    final user = jsonDecode(utf8.decode(userResponse.bodyBytes));
    return User.fromJson(user['data']);
  }

  Future<List<Product>> getMainProducts(String userId) async {
    final mainProductsResponse = await _appRepository.getMainProducts(userId);
    if (mainProductsResponse.statusCode != 200) {}
    final mainProducts =
        jsonDecode(utf8.decode(mainProductsResponse.bodyBytes));
    if (mainProducts['data'].length == 0) {
      return [];
    }
    final products = mainProducts['data']
        .map<Product>((product) => Product.fromJson(product))
        .toList();
    return products;
  }

  Future<List<Ad>> getMainAds(String userId) async {
    final mainAdsResponse = await _appRepository.getMainAds(userId);
    if (mainAdsResponse.statusCode != 200) {}
    final mainAds = jsonDecode(utf8.decode(mainAdsResponse.bodyBytes));
    if (mainAds['data'].length == 0) {
      return [];
    }
    final ads = mainAds['data'].map<Ad>((ad) => Ad.fromJson(ad)).toList();
    return ads;
  }

  Future<List> getHome() async {
    final mainHomeResponse = await _appRepository.getHome();
    if (mainHomeResponse.statusCode != 200) {}
    final mainHome = jsonDecode(utf8.decode(mainHomeResponse.bodyBytes));
    final ads = mainHome['ads'].map<Ad>((ad) => Ad.fromJson(ad)).toList();
    final products = mainHome['products']
        .map<Product>((product) => Product.fromJson(product))
        .toList();
    return [ads, products];
  }

  Future<bool> createProduct(Product product) async {
    final newProduct = await _appRepository.createProduct(product);
    inspect(newProduct);
    if (newProduct.statusCode != 201) {
      return false;
    } else {
      return true;
    }
  }
}

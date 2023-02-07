import 'dart:io';

const emulateAndroid = 'http://10.0.2.2:3000/api';
const emulateiOS = 'http://localhost:3000/api';
String baseUrl = Platform.isAndroid ?emulateAndroid:emulateiOS;


String getUserByIdUrl = '$baseUrl/users/id/';
String getMainProductsUrl = '$baseUrl/products/id/';
String getMainAdsUrl = '$baseUrl/advertisements/id/';
String getMainHomeUrl = '$baseUrl/products/home';
String createProductUrl = '$baseUrl/products/create';

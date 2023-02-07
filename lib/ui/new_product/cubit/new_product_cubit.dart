import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/domain/usecase/app_use_case.dart';
import 'package:my_shop/utils/constants.dart';

part 'new_product_state.dart';

var _profileController = TextEditingController();
var _nameController = TextEditingController();
var _descriptionController = TextEditingController();
var _priceController = TextEditingController();
var _brandController = TextEditingController();
var _categoryController = TextEditingController();

class NewProductCubit extends Cubit<NewProductState> {
  NewProductCubit(this._appUseCase)
      : super(NewProductState(
            _profileController,
            _nameController,
            _descriptionController,
            _priceController,
            _brandController,
            _categoryController));

  final AppUseCase _appUseCase;

  void init() {
    log('INIT');
    NewProductState initState = state.copyWith(
        profileController: TextEditingController(),
        nameController: TextEditingController(),
        descriptionController: TextEditingController(),
        priceController: TextEditingController(),
        brandController: TextEditingController(),
        categoryController: TextEditingController(),
        status: true);
    emit(initState);
  }

  void setStatus(bool value) {
    NewProductState newState = state.copyWith(status: value);
    emit(newState);
  }

  bool validationForm() {
    bool isValid = true;
    if (state.profileController.text.isEmpty) isValid = false;
    if (state.nameController.text.isEmpty) isValid = false;
    if (state.descriptionController.text.isEmpty) isValid = false;
    if (state.priceController.text.isEmpty) isValid = false;
    if (state.brandController.text.isEmpty) isValid = false;
    if (state.categoryController.text.isEmpty) isValid = false;
    log(isValid.toString());
    return isValid;
  }

  Future<bool> createProduct() async {
    var product = Product(
      name: state.nameController.text,
      description: state.descriptionController.text,
      brand: state.brandController.text,
      category: state.categoryController.text,
      image: state.profileController.text,
      userId: userId,
      price: int.parse(state.priceController.text),
      status: state.status,
    );
    final newProduct = await _appUseCase.createProduct(product);
    return newProduct;
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/domain/models/ad_models.dart';
import 'package:my_shop/domain/usecase/app_use_case.dart';
import 'package:my_shop/utils/constants.dart';

part 'new_ad_state.dart';

var _profileController = TextEditingController();
var _nameController = TextEditingController();
var _descriptionController = TextEditingController();
var _discountController = TextEditingController();
var _brandController = TextEditingController();
var _categoryController = TextEditingController();

class NewAdCubit extends Cubit<NewAdState> {
  NewAdCubit(this._appUseCase)
      : super(NewAdState(
            _profileController,
            _nameController,
            _descriptionController,
            _discountController,
            _brandController,
            _categoryController));

  final AppUseCase _appUseCase;

  void init() {
    log('INIT');
    NewAdState initState = state.copyWith(
        profileController: TextEditingController(),
        nameController: TextEditingController(),
        descriptionController: TextEditingController(),
        discountController: TextEditingController(),
        brandController: TextEditingController(),
        categoryController: TextEditingController(),
        status: true);
    emit(initState);
  }

  void setStatus(bool value) {
    NewAdState newState = state.copyWith(status: value);
    emit(newState);
  }

  bool validationForm() {
    bool isValid = true;
    if (state.profileController.text.isEmpty) isValid = false;
    if (state.nameController.text.isEmpty) isValid = false;
    if (state.descriptionController.text.isEmpty) isValid = false;
    if (state.discountController.text.isEmpty) isValid = false;
    if (state.brandController.text.isEmpty) isValid = false;
    if (state.categoryController.text.isEmpty) isValid = false;
    log(isValid.toString());
    return isValid;
  }

  Future<bool> createAd() async {
    Ad ad = Ad(
      name: state.nameController.text,
      description: state.descriptionController.text,
      brand: state.brandController.text,
      category: state.categoryController.text,
      image: state.profileController.text,
      userId: userId,
      discount: num.parse(state.discountController.text),
      status: state.status, 
      id: '',
    );
    final newAd = await _appUseCase.createAd(ad);
    return newAd;
  }
}

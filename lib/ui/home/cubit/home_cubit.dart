import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/domain/models/ad_models.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/domain/models/user_model.dart';
import 'package:my_shop/domain/usecase/app_use_case.dart';
import 'package:my_shop/utils/constants.dart';

part 'home_state.dart';

var _urlController = TextEditingController();
var _firstNameController = TextEditingController();
var _lastNameController = TextEditingController();
var _emailController = TextEditingController();
var _ageController = TextEditingController();

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._appUseCase)
      : super(HomeState(_urlController, _firstNameController,
            _lastNameController, _emailController, _ageController));

  final AppUseCase _appUseCase;

  void setIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void getUser() async {
    try {
      final user = await _appUseCase.getUserById(userId);
      TextEditingController urlController = TextEditingController();
      urlController.text = user!.urlProfile;
      TextEditingController firstNameController = TextEditingController();
      firstNameController.text = user.firstName;
      TextEditingController lastNameController = TextEditingController();
      lastNameController.text = user.lastName;
      TextEditingController emailController = TextEditingController();
      emailController.text = user.email;
      TextEditingController ageController = TextEditingController();
      ageController.text = user.age.toString();
      HomeState newState = state.copyWith(
        urlController: urlController,
        firstNameController: firstNameController,
        lastNameController: lastNameController,
        emailController: emailController,
        ageController: ageController,
        user: user
      );
      emit(newState);
    } catch (_) {}
  }

  void getHome() async {
    try {
      final home = await _appUseCase.getHome();
      HomeState newState = state.copyWith(ad: home[0][0], products: home[1]);
      emit(newState);
    } catch (_) {}
  }
}

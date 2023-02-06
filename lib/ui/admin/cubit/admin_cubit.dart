import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_shop/domain/models/ad_models.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/domain/usecase/app_use_case.dart';
import 'package:my_shop/utils/constants.dart';

part 'admin_state.dart';

PageController controller = PageController();

class AdminCubit extends Cubit<AdminState> {
  AdminCubit(this._appUseCase) : super(AdminState(controller));

  final AppUseCase _appUseCase;

  void getMainProducts() async {
    try{
      final mainProducts = await _appUseCase.getMainProducts(userId);
      AdminState newState = state.copyWith(products: mainProducts);
      emit(newState);
    }catch(_){}
  }

  void getMainAds() async {
    try{
      final mainAds = await _appUseCase.getMainAds(userId);
      AdminState newState = state.copyWith(ads: mainAds);
      emit(newState);
    }catch(_){}
  }
}

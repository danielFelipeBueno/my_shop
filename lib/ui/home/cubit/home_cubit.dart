import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:my_shop/domain/models/ad_models.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/domain/models/user_model.dart';
import 'package:my_shop/domain/usecase/app_use_case.dart';
import 'package:my_shop/utils/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._appUseCase) : super(HomeState());

  final AppUseCase _appUseCase;

  void setIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void getUser() async {
    try {
      final user = await _appUseCase.getUserById(userId);
      HomeState newState = state.copyWith(user: user);
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

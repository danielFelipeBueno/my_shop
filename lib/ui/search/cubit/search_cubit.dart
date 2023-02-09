import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/domain/usecase/app_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._appUseCase) : super(SearchState());

  final AppUseCase _appUseCase;

  void search(String query) async {
    try {
      List<Product> products = await _appUseCase.search(query);
      SearchState newState = state.copyWith(products: products);
      emit(newState);
    } catch (_) {}
  }
}

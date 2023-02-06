
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/data/app_impl.dart';
import 'package:my_shop/data/app_repository.dart';
import 'package:my_shop/domain/usecase/app_use_case.dart';

List<RepositoryProvider> buildRepositories(){
  return [
    RepositoryProvider<AppRepository>(create: (_)=>AppImpl()),
    RepositoryProvider<AppUseCase>(create: (context)=>AppUseCase( context.read()))
  ];
}
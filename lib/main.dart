import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/ui/admin/cubit/admin_cubit.dart';
import 'package:my_shop/ui/home/cubit/home_cubit.dart';
import 'package:my_shop/ui/home/home_screen.dart';
import 'package:my_shop/utils/dependencies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: buildRepositories(), 
      child: MultiBlocProvider(
        providers: [
          BlocProvider( create: (context) => HomeCubit( context.read() )),
          BlocProvider( create: (context) => AdminCubit(context.read() ))
        ],
        child: MaterialApp(
          builder: (context, child){
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0
              ), 
              child: child!
            );
          },
          title: 'My Shop',
          debugShowCheckedModeBanner: false,
          home: const HomeScreen()
        )
      )
    );
  }
}

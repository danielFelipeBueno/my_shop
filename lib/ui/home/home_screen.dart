import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/ui/admin/cubit/admin_cubit.dart';
import 'package:my_shop/ui/home/widgets/custom_app_bar.dart';
import 'package:my_shop/ui/new_product/new_product_screen.dart';
import 'package:my_shop/ui/shop/shop_screen.dart';
import 'package:my_shop/utils/constants.dart';
import 'package:my_shop/ui/admin/admin_screen.dart';
import 'package:my_shop/ui/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getUser();
    context.read<AdminCubit>().getMainProducts();
    context.read<AdminCubit>().getMainAds();
    context.read<HomeCubit>().getHome();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffE1F5FF),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: MediaQuery.of(context).size.height * 0.08,
            backgroundColor: const Color(0xffE1F5FF),
            elevation: 0,
            flexibleSpace: const CustomAppBar(),
          ),
          body: selectedPage(state.index),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: state.index == 1 ?SizedBox(
            height: 70,
            width: 70,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: const Color(0xff1A1A1A),
                onPressed: () {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const NewProductScreen())
                  );
                },
                child: const Icon(CupertinoIcons.add),
              ),
            ),
          ):Container(),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Icon(CupertinoIcons.heart_solid)
                ),
                label: 'Shop'
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Icon(Icons.work)
                ),
                label: 'Admin'
              ),
            ],
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kSecondaryColor,
            onTap: (int index){
              context.read<HomeCubit>().setIndex(index);
            },
          ),
        );
      },
    );
  }

  Widget selectedPage(int index){
    if (index == 0){
      return const ShopScreen();
    }else if(index == 1){
      return const AdminScreen();
    }else{
      return Container();
    }
  }
}

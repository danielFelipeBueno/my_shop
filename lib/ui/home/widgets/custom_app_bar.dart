import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/ui/home/cubit/home_cubit.dart';
import 'package:my_shop/ui/home/widgets/profile_button.dart';
import 'package:my_shop/ui/shopping_cart/cubit/shopping_cart_cubit.dart';
import 'package:my_shop/ui/shopping_cart/shopping_cart_screen.dart';
import 'package:my_shop/utils/constants.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../edit_profile_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String image = defaultProfile;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        image = state.user == null ? defaultProfile : state.user!.urlProfile;
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: Center(
              child: Row(
                children: [
                  ProfileButton(image: image),
                  const Spacer(),
                  Text(
                      state.user != null
                          ? 'Hola ${state.user!.firstName}'
                          : 'Hola',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 36,
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
                    builder: (context, state) {
                      return state.products.isNotEmpty 
                      ?CircleAvatar(
                        radius: 10,
                        backgroundColor: kPrimaryColor,
                        child: Text(state.products.length.toString()),
                      ) :Container();
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ShoppingCartScreen()));
                      },
                      icon: const Icon(CupertinoIcons.shopping_cart,
                          color: kPrimaryColor, size: 35))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

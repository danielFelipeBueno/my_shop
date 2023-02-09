import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/ui/home/cubit/home_cubit.dart';
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
    String image = '';
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        image = state.user == null ?'':state.user!.urlProfile;
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: Center(
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        showTopModalSheet(
                            context,
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.35,
                              color: Colors.white,
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      const Text(
                                        'Mi Perfil',
                                        style: TextStyle(
                                            color: kSecondaryColor,
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(image),
                                            radius: 50
                                          ),
                                          const Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  state.user != null
                                                      ? state.user!.firstName +
                                                          ' ' +
                                                          state.user!.lastName
                                                      : 'Hola',
                                                  style: const TextStyle(
                                                      color: kSecondaryColor,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const SizedBox(height: 10),
                                              Text(state.user != null
                                                  ? '${state.user!.age} años'
                                                  : ''),
                                              const SizedBox(height: 5),
                                              Text(state.user != null
                                                  ? state.user!.email
                                                  : ''),
                                              // MaterialButton(
                                              //   elevation: 0,
                                              //   onPressed: () {
                                              //     Navigator.push(
                                              //         context,
                                              //         MaterialPageRoute(
                                              //             builder: (context) =>
                                              //                 const EditProfileScreen()));
                                              //   },
                                              //   color: kPrimaryColor,
                                              //   child: const Text(
                                              //     'Editar',
                                              //     style: TextStyle(
                                              //         color: Colors.white),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                          const SizedBox(width: 35),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                      child: CircleAvatar(backgroundImage: NetworkImage(image),)),
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

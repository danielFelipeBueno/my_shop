
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/ui/home/cubit/home_cubit.dart';
import 'package:my_shop/utils/constants.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return InkWell(
            onTap: () {
              showTopModalSheet(
                  context,
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    color: Colors.white,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            const Text(
                              'Mi Perfil',
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    backgroundImage: NetworkImage(image),
                                    radius: 50),
                                const Spacer(),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            fontWeight: FontWeight.bold)),
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
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
            ));
      },
    );
  }
}

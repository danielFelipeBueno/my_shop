import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/ui/admin/cubit/admin_cubit.dart';
import 'package:my_shop/ui/admin/widgets/advertisement_card.dart';
import 'package:my_shop/utils/constants.dart';
import 'package:my_shop/ui/admin/widgets/product_card.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Item $i');
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      state.controller.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                    },
                    child: const Text(
                      'Mis Productos',
                      style: textTitleActiveStyle,
                    )
                  ),
                  TextButton(
                    onPressed: () {
                      state.controller.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                    },
                    child: const Text(
                      'Mis Anuncios',
                      style: textTitleInactiveStyle,
                    )
                  ),
                ],
              ),
              const Divider(
                height: 3,
                color: kSecondaryColor,
                thickness: 3,
              ),
              Expanded(
                child: Theme(
                  data: ThemeData(highlightColor: kSecondaryColor),
                  child: Scrollbar(
                    scrollbarOrientation: ScrollbarOrientation.top,
                    thumbVisibility: true,
                    controller: state.controller,
                    child: PageView(
                      controller: state.controller,
                      children: [
                        ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(product: state.products[index],);
                          },
                        ),
                        ListView.builder(
                          itemCount: state.ads.length,
                          itemBuilder: (context, index) {
                            return AdvertisementCard(ad: state.ads[index],);
                          },
                        ),
                      ],
                    )
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

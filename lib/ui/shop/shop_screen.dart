import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/ui/admin/widgets/advertisement_card.dart';
import 'package:my_shop/ui/home/cubit/home_cubit.dart';
import 'package:my_shop/ui/search/search_module.dart';
import 'package:my_shop/ui/shop/widgets/shop_product_card.dart';
import 'package:my_shop/utils/constants.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(horizontal: 14);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: edgeInsets,
                  child: Text('encuentra todo lo que necesitas en Mi App'),
                ),
              ),
              const SearchModule(),
              state.ad != null
                  ? const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: Text('Oferta del día',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 30,
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  : Container(),
              state.ad != null 
              ? AdvertisementCard(ad: state.ad!) : Container(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
                  child: Text('Productos',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 30,
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  for (var i = 0; state.products.length > i; i++)
                    ShopProductCard(product: state.products[i]),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}


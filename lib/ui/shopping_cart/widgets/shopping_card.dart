import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/ui/shopping_cart/cubit/shopping_cart_cubit.dart';
import 'package:my_shop/utils/constants.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({Key? key, required this.product, required this.index}) : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadowCard,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Row(
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width / 13,
            backgroundImage: NetworkImage(product.image),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.43,
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: const TextStyle(
                        fontSize: 22,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold)),
                Text(
                  product.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              children: [
                IconButton(
                    onPressed: () => context.read<ShoppingCartCubit>().removeProduct(index),
                    icon: const Icon(CupertinoIcons.trash, size: 26)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: Text(
                    '\$${product.price}',
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

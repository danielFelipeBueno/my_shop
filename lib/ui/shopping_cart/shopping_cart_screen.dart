import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/ui/shopping_cart/cubit/shopping_cart_cubit.dart';
import 'package:my_shop/ui/shopping_cart/widgets/shopping_card.dart';
import 'package:my_shop/utils/constants.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffE1F5FF),
          appBar: AppBar(
            elevation: 0,
            foregroundColor: kSecondaryColor,
            backgroundColor: const Color(0xffE1F5FF),
            title: const Text(
              'Carrito de Compras',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ShoppingCard(product: state.products[index],index: index,);
                },
              ),
            ),
          ),
          bottomSheet: Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5,
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 5),
              color: Colors.white,
              child: Column(
                children: [
                  Text('Total: \$${state.total.toInt()}',
                      style:
                          const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    height: 40,
                    minWidth: double.infinity,
                    color: kPrimaryColor,
                    onPressed: () {},
                    child: const Text(
                      'Comprar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}

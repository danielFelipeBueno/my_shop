import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/ui/home/home_screen.dart';
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
              height: MediaQuery.of(context).size.height / 4.4,
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 4.4),
              color: Colors.white,
              child: Column(
                children: [
                  Text('Total: \$${state.total.toInt()}',
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)
                  ),
                  const Spacer(),
                  state.products.isNotEmpty ?TextButton(
                    onPressed: () => context.read<ShoppingCartCubit>().emptyCart(), 
                    child: const Text('Vaciar Carrito', style: TextStyle(color: kSecondaryColor),)
                  ):Container(),
                  state.products.isNotEmpty ?MaterialButton(
                    height: 40,
                    minWidth: double.infinity,
                    color: kPrimaryColor,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Compra Realizada'),
                            content: const Text('El repartidor se pondrá en contacto contigo'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Aceptar'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const HomeScreen())
                                  );
                                },
                              )
                            ],
                          );
                        }
                      );
                    },
                    child: const Text(
                      'Pagar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ): Container(),
                ],
              )),
        );
      },
    );
  }
}

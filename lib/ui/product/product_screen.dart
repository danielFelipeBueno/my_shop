import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/ui/shopping_cart/cubit/shopping_cart_cubit.dart';
import 'package:my_shop/ui/shopping_cart/shopping_cart_screen.dart';
import 'package:my_shop/utils/constants.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.symmetric(vertical: 15);
    return Scaffold(
      backgroundColor: const Color(0xffE1F5FF),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(CupertinoIcons.back))),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShoppingCartScreen()));
                  },
                  icon: const Icon(CupertinoIcons.shopping_cart,
                      color: kPrimaryColor, size: 35))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
                child: CircleAvatar(
              backgroundImage: NetworkImage(product.image),
              radius: MediaQuery.of(context).size.width / 4,
            )),
          ),
          Text(
            product.name,
            style: const TextStyle(
                color: kSecondaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Descripción',
                      style: TextStyle(
                          fontSize: 24,
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    MaterialButton(
                      color: kPrimaryColor,
                      onPressed: () {},
                      child: Text(
                        '\$${product.price}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.description,
                      style: const TextStyle(fontSize: 15),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Table(
                  children: [
                    TableRow(children: [
                      const Padding(
                        padding: edgeInsets,
                        child: Text('Marca',
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: edgeInsets,
                        child: Text(product.brand,
                            style: const TextStyle(
                                color: kSecondaryColor, fontSize: 16)),
                      )
                    ]),
                    TableRow(children: [
                      const Padding(
                        padding: edgeInsets,
                        child: Text('Categoria',
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: edgeInsets,
                        child: Text(product.category,
                            style: const TextStyle(
                                color: kSecondaryColor, fontSize: 16)),
                      )
                    ])
                  ],
                )
              ],
            ),
          ),
          const Spacer(flex: 5),
          Padding(
            padding: const EdgeInsets.all(30),
            child: MaterialButton(
              height: 40,
              minWidth: double.infinity,
              color: kPrimaryColor,
              onPressed: () {
                context.read<ShoppingCartCubit>().addProduct(product);
              },
              child: const Text(
                'Añadir al Carrito',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const Spacer()
        ],
      )),
    );
  }
}

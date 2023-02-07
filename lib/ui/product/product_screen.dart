import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/domain/models/products_model.dart';
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
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(CupertinoIcons.back))),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
                child: CircleAvatar(
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
                      child: const Text(
                        '\$9.99',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris imperdiet blandit nunc, a blandit sem porttitor vel. Maecenas pellentesque sed.'),
                const SizedBox(
                  height: 30,
                ),
                Table(
                  children: const [
                    TableRow(children: [
                      Padding(
                        padding: edgeInsets,
                        child: Text('Marca',
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: edgeInsets,
                        child: Text('Marca',
                            style: TextStyle(
                                color: kSecondaryColor, fontSize: 16)),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: edgeInsets,
                        child: Text('Categoria',
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: edgeInsets,
                        child: Text('Categoria',
                            style: TextStyle(
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
              onPressed: () {},
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

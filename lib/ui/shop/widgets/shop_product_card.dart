import 'package:flutter/material.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/ui/product/product_screen.dart';
import 'package:my_shop/utils/constants.dart';

class ShopProductCard extends StatelessWidget {
  const ShopProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(product: product)));
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        width: MediaQuery.of(context).size.width / 2.3,
        height: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: kSecondaryColor, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.network(product.image),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: kSecondaryColor, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

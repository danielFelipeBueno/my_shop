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
                builder: (context) => ProductScreen(product: product, isAdmin: false,)));
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        width: MediaQuery.of(context).size.width / 2.4,
        height: MediaQuery.of(context).size.width / 2.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: boxShadowCard
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.network(product.image, fit: BoxFit.cover),
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

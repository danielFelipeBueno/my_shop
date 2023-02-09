import 'package:flutter/material.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/utils/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: kSecondaryColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(product.image),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CircleAvatar(
                        radius: 17,
                        backgroundColor: product.status
                            ? const Color(0xff4CCB20)
                            : const Color(0xffFF0000),
                        child: Icon(
                            product.status
                                ? Icons.check_circle_outline_outlined
                                : Icons.cancel_outlined,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Text(product.description),
                  const Spacer(),
                  Text(product.brand, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 3)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

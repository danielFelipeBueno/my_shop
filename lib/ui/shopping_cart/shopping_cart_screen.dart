import 'package:flutter/material.dart';
import 'package:my_shop/ui/admin/widgets/advertisement_card.dart';
import 'package:my_shop/utils/constants.dart';

import '../shop/widgets/shop_product_card.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Item $i');
    return Scaffold(
      backgroundColor: const Color(0xffE1F5FF),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: kSecondaryColor,
        backgroundColor: const Color(0xffE1F5FF),
        title: const Text('Carrito de Compras',
          textAlign: TextAlign.center,
          style: TextStyle(color: kSecondaryColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: kSecondaryColor, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(30))
                ),
                child: Row(
                  children: [
                    CircleAvatar(radius: MediaQuery.of(context).size.width/12),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        children: const [
                          Text('ProductName',style: TextStyle(fontSize: 22, color: kSecondaryColor,fontWeight: FontWeight.bold)),
                          Text('Lorem ipsum dolor\nsit amet, consectetur')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: (){}, 
                            child: const Text('+1', style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold,fontSize: 22),)
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
                            ),
                            child: const Text('\$9.99', style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        height: MediaQuery.of(context).size.height/5,
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/5),
        color: Colors.white,
        child: Column(
          children: [
            const Text('Total: \$199.99',style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            const Spacer(),
            MaterialButton(
              height: 40,
              minWidth: double.infinity,
              color: kPrimaryColor,
              onPressed: (){},
              child: const Text('Comprar',style: TextStyle(color: Colors.white, fontSize: 18),),
            ),
          ],
        )
      ),
    );
  }
}
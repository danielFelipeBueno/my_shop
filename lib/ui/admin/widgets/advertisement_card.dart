import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/domain/models/ad_models.dart';
import 'package:my_shop/ui/new_ad/cubit/new_ad_cubit.dart';
import 'package:my_shop/utils/constants.dart';

class AdvertisementCard extends StatelessWidget {
  AdvertisementCard({Key? key, required this.ad}) : super(key: key);

  final Ad ad;
  
  String image ='https://images.materilejuguetes.com/imagenes/productos/5@img5cad51fd69d85.jpg';

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      // border: Border.all(color: kSecondaryColor, width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      boxShadow: boxShadowCard,
      color: const Color(0xffB576AD).withOpacity(0.6)
    );
    return Container(
      height: 180,
      decoration: boxDecoration,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 160,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(ad.discount * 100).toInt()}% de\ndescuento',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: kSecondaryColor,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
                Text(ad.name,
                    style:
                        const TextStyle(color: kSecondaryColor, fontSize: 16)),
                const Spacer(),
                MaterialButton(
                  elevation: 8,
                  onPressed: () {},
                  color: kPrimaryColor,
                  child: const Text(
                    'ver oferta',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 150,
            height: 150,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.network(ad.image,fit: BoxFit.contain)
          )
        ],
      ),
    );
  }
}

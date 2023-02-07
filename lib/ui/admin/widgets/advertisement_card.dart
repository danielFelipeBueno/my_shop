import 'package:flutter/material.dart';
import 'package:my_shop/domain/models/ad_models.dart';
import 'package:my_shop/utils/constants.dart';

class AdvertisementCard extends StatelessWidget {
  const AdvertisementCard({Key? key, required this.ad}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        border: Border.all(color: kSecondaryColor, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(30)));
    return Container(
      height: 180,
      decoration: boxDecoration,
      margin: const EdgeInsets.symmetric(vertical: 12),
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
            // color: Colors.red,
            width: 160,
          )
        ],
      ),
    );
  }
}

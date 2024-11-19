import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/models/product_model.dart';
import 'package:backend_shop/screens/product_screen.dart';
import 'package:flutter/material.dart';

class AdTile extends StatelessWidget {
  final Product adProduct;
  const AdTile({super.key, required this.adProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(27.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        height: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  adProduct.productName,
                  style: TextStyle(
                    color: kBgColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                 Text(
                   'Order, Eat, Enjoy',
                  style: TextStyle(
                    color: kBgColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation1,
                            Animation<double> animation2) {
                          return ProductScreen(choosenProduct: adProduct);
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBgColor,
                    foregroundColor: kBlackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Order Now',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Image.asset(adProduct.productImage, width: 132,)
          ],
        ),
      ),
    );
  }
}

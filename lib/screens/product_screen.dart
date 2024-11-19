import 'package:backend_shop/componenets/food_component_tile.dart';
import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/core/resturant_core.dart';
import 'package:backend_shop/data/menu.dart';
import 'package:backend_shop/screens/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class ProductScreen extends StatefulWidget {
  final Product choosenProduct;

  const ProductScreen({super.key, required this.choosenProduct});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int productCount = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>(builder: (context, resturant, child) {
      bool isFavorite = resturant.isItemFav(widget.choosenProduct);
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                print('asd');
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
          title: const Text(
            'Detail',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: GestureDetector(
                onTap: () {
                  if (!isFavorite) {
                    resturant.addFoodToFavs(widget.choosenProduct);
                  } else {
                    resturant.deleteFoodFromFavs(widget.choosenProduct);
                  }
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 27,
                  color: isFavorite ? Colors.red.shade600 : null,
                ),
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    widget.choosenProduct.productImage,
                    width: 230,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.choosenProduct.productName,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFf7b34a),
                            size: 24,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.choosenProduct.productRating.toString(),
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.choosenProduct.foodSupplements
                          .map((supplement) {
                        return FoodComponenetTile(supplement: supplement);
                      }).toList(),
                    ),

                    // child: menuFoods.expand((product) => product.foodSupplements.map((supplement) {
                    //   return FoodComponentTile(supplement: supplement);
                    // })).toList(),                    // child: Row(
                    //   children: [
                    //     FoodComponenetTile(
                    //       supplementImage: 'assets/supps/merguez.png',
                    //       supplementName: 'Merguez',
                    //       supplementWidth: 33,
                    //     ),
                    //     FoodComponenetTile(
                    //         supplementImage: 'assets/supps/eggs.png',
                    //         supplementName: 'Oeufs',
                    //         supplementWidth: 24),
                    //   ],
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    '${widget.choosenProduct.productPrice.toString()}DT',
                    style: const TextStyle(
                        fontSize: 33, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About Product',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.choosenProduct.productDesc,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${(widget.choosenProduct.productPrice * productCount).toString()}DT',
                        style: const TextStyle(
                            fontSize: 33, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'Total price',
                        style: TextStyle(fontSize: 19),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<Resturant>()
                          .addFoodToCart(widget.choosenProduct);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(
                            child: Text(
                                '${widget.choosenProduct.productName} has been added to your cart!'),
                          ),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder: (BuildContext context,
                      //         Animation<double> animation1,
                      //         Animation<double> animation2) {
                      //       return const CartScreen();
                      //     },
                      //     transitionsBuilder:
                      //         (context, animation, secondaryAnimation, child) {
                      //       const begin = Offset(1.0, 0.0);
                      //       const end = Offset.zero;
                      //       const curve = Curves.ease;
                      //
                      //       var tween = Tween(begin: begin, end: end)
                      //           .chain(CurveTween(curve: curve));
                      //
                      //       return SlideTransition(
                      //         position: animation.drive(tween),
                      //         child: child,
                      //       );
                      //     },
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlackColor,
                      foregroundColor: kBgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

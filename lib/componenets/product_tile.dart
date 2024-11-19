import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/core/resturant_core.dart';
import 'package:backend_shop/models/product_model.dart';
import 'package:backend_shop/screens/cart_screen.dart';
import 'package:backend_shop/screens/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductScreen(choosenProduct: product),
          ),
        );
      },
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.04),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFFf7b34a),
                    size: 19,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    product.productRating.toString(),
                    style: const TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
            Center(
              child: Image.asset(
                product.productImage,
                width: 80,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.productName,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0, bottom: 4),
              child: Text(
                '${product.productPrice.toString()}DT',
                style: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

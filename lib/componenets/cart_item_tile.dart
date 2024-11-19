import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/core/resturant_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class CartItemTile extends StatefulWidget {
  final Product product;

  const CartItemTile(
      {super.key, required this.product});

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  int productCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: ListTile(
        title: Text(
          widget.product.productName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: Image.asset(widget.product.productImage),
        subtitle: Text(
          '${widget.product.productPrice.toString()}DT',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        trailing: GestureDetector(
                onTap: () {
                  context.read<Resturant>().deleteFoodFromCart(widget.product);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  color: Colors.transparent,
                  child: const Icon(Icons.remove),
                ),
              ),
      ),
    );
  }
}

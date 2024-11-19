import 'package:backend_shop/componenets/product_tile.dart';
import 'package:backend_shop/data/menu.dart';
import 'package:backend_shop/screens/notifications_screen.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Che Gusto',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),

        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "All Foods",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (1/1.2),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children:
                    menuFoods.map((e) => ProductTile(product: e)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

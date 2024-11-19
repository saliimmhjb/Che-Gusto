import 'package:backend_shop/componenets/product_tile.dart';
import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/core/resturant_core.dart';
import 'package:backend_shop/data/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
      body: context.watch<Resturant>().favoritesItems.isEmpty
          ? Center(
        child: Text(
          'Your favorites list is empty!',
          style: TextStyle(
              fontSize: 20, color: kBlackColor.withOpacity(0.5)),
        ),
      ): Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text("My Favorites",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),),
          ),
          const SizedBox(height: 6,),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (1/1.2),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: context.watch<Resturant>().favoritesItems.map((e) => ProductTile(product: e)).toList(),
              ),
            ),
          ),
        ],

      ),
    );
  }
}

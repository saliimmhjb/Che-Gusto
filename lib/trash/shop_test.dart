// import 'package:backend_shop/componenets/product_tile.dart';
// import 'package:backend_shop/data/menu.dart';
// import 'package:flutter/material.dart';
//
// class ShopTest extends StatelessWidget {
//   const ShopTest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // number of items in each row
//           childAspectRatio: (1/1.2),
//           mainAxisSpacing: 10.0, // spacing between rows
//           crossAxisSpacing: 20.0, // spacing between columns
//         ),
//         padding: const EdgeInsets.all(8.0), // padding around the grid
//         itemCount: menuFoods.length, // total number of items
//         itemBuilder: (context, index) {
//           return ProductTile(product: menuFoods[index]);
//         },
//       )
//     );
//   }
// }

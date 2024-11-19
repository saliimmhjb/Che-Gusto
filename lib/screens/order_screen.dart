import 'dart:core';
import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/core/auth_core.dart';
import 'package:backend_shop/core/resturant_core.dart';
import 'package:backend_shop/screens/notifications_screen.dart';
import 'package:backend_shop/screens/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 23),
        //   child: GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).pop();
        //     },
        //     child: const Icon(Icons.arrow_back_ios),
        //   ),
        // ),
        title: const Text(
          'Your order receipt',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                'Thank you for your order!',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kPrimaryColor.withOpacity(0.5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Here's your receipt.",
                            style: TextStyle(fontSize: 18)),
                        Text(
                            DateFormat('yyyy-MM-dd hh:mm')
                                .format(DateTime.now()),
                            style: const TextStyle(fontSize: 17)),
                        const Text("-------------",
                            style: TextStyle(fontSize: 17)),
                        ...context.watch<Resturant>().shoppingCart.map(
                              (e) => Text(
                                  '${e.productName} - ${e.productPrice}DT',
                                  style: const TextStyle(fontSize: 17)),
                            ),
                        const Text(
                          "-------------",
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'Total Items : ${context.watch<Resturant>().shoppingCart.length.toString()}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        Text(
                          'Total Price : ${context.watch<Resturant>().getCartTotal().toString()}DT',
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text(
                'Estimated delivery time is : 10:08',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(23.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const NotificationsScreen(),
                    ),
                  );
                  context.read<Resturant>().clearOrders();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Center(
                        child: Text(
                            'Order has been submitted! Stay connected with your phone..'),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlackColor,
                  foregroundColor: kBgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Thank you!',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

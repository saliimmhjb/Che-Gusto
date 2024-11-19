import 'package:backend_shop/componenets/cart_item_tile.dart';
import 'package:backend_shop/componenets/promo_code_tile.dart';
import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/core/resturant_core.dart';
import 'package:backend_shop/data/firebase.dart';
import 'package:backend_shop/screens/order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool deleteMode = false;
  FirestoreService db = FirestoreService();
  TextEditingController orderNumberController = TextEditingController();

  @override
  void payOrders() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify Order',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Text(
              'Type your number to keep in touch with delivery guy!',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        content: TextField(
          controller: orderNumberController,
          maxLength: 8,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Your phone number',
            counterText: '',
          ),
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                foregroundColor: kBgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                orderNumberController.clear();
              },
              child: const Text('Cancel')),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: kBgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (orderNumberController.text.length == 8) {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text(
                            'Are you sure you want to order those items?',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade600,
                                foregroundColor: kBgColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                orderNumberController.clear();
                              },
                              child: const Text('No'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                foregroundColor: kBgColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                String cartItems = Provider.of<Resturant>(
                                        context,
                                        listen: false)
                                    .getShoppingCartItemsAsString();
                                String cartItemPrices = Provider.of<Resturant>(
                                        context,
                                        listen: false)
                                    .getShoppingCartPricesAsString();
                                db.saveOrderToDB(cartItems, cartItemPrices, orderNumberController.text);
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation1,
                                        Animation<double> animation2) {
                                      return const OrderScreen();
                                    },
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(0.0, 1.0);
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
                                orderNumberController.clear();
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      });
                } else {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(
                        child: Text(
                            'Please make sure your phone number is correct!'),
                      ),
                    ),
                  );
                }
              },
              child: const Text('Order')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          'Your cart',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: context.watch<Resturant>().shoppingCart.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(
                    fontSize: 20, color: kBlackColor.withOpacity(0.5)),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: ListView(
                      children: [
                        ...context.watch<Resturant>().shoppingCart.map(
                              (e) => CartItemTile(
                                product: e,
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: PromoCodeTile(),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item total :',
                            style: TextStyle(
                                fontSize: 19,
                                color: kBlackColor.withOpacity(0.5)),
                          ),
                          Text(
                            '${context.watch<Resturant>().getCartTotal().toString()}DT',
                            style: const TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery :',
                            style: TextStyle(
                                fontSize: 19,
                                color: kBlackColor.withOpacity(0.5)),
                          ),
                          const Text(
                            '8.0DT',
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Divider(
                  indent: 25,
                  endIndent: 25,
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${(context.watch<Resturant>().getCartTotal() + 8).toString()}DT',
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: payOrders,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: kBgColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: const Text(
                        'Payment',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

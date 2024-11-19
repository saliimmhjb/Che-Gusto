import 'dart:math';

import 'package:backend_shop/componenets/ad_tile.dart';
import 'package:backend_shop/componenets/product_tile.dart';
import 'package:backend_shop/componenets/search_bar_tile.dart';
import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/core/auth_core.dart';
import 'package:backend_shop/data/menu.dart';
import 'package:backend_shop/models/product_model.dart';
import 'package:backend_shop/screens/cart_screen.dart';
import 'package:backend_shop/screens/favorites_screen.dart';
import 'package:backend_shop/screens/login_screen.dart';
import 'package:backend_shop/screens/notifications_screen.dart';
import 'package:backend_shop/screens/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late Product finalRandomProduct;

  @override
  void initState() {
    super.initState();
    finalRandomProduct = getRandomProduct();
  }

  Product getRandomProduct() {
    Random random = Random();
    int randomIndex = random.nextInt(menuFoods.length);
    return menuFoods[randomIndex];
  }

  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
      backgroundColor: kBgColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedFontSize: 4,
        unselectedFontSize: 4,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
            if (_currentIndex == 3) {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return const CartScreen();
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
            }
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return const ProductsScreen();
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
            }
            if (_currentIndex == 2) {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return const FavoritesScreen();
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
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: kBlackColor,
                size: 28,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_dining_sharp,
                color: kBlackColor,
                size: 28,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: kBlackColor,
                size: 28,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: kBlackColor,
                size: 28,
              ),
              label: ''),
        ],
      ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return const NotificationsScreen();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, -1.0);
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
            child: const Icon(Icons.notifications_none,size: 27,),
          ),
        ),
        title: const Text(
          'Che Gusto',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: GestureDetector(onTap: () {
              final _authService = AuthService();
              _authService.signOut();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: kPrimaryColor,
                  content: Center(child: Text('You log out successfully!')),
                ),
              );
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return const LoginScreen();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(-1.0, 0.0);
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
            }, child: Icon(Icons.logout)),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          AdTile(
            adProduct: finalRandomProduct,
          ),
          //const SearchBarTile(),
          // const SizedBox(
          //   height: 5,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Food',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation1,
                            Animation<double> animation2) {
                          return const ProductsScreen();
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
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
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

import 'package:backend_shop/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resturant extends ChangeNotifier{
  List<Product> shoppingCart = [];

  void addFoodToCart(Product product) {
    shoppingCart.add(product);
    notifyListeners();
  }

  void deleteFoodFromCart(Product product) {
    shoppingCart.remove(product);
    notifyListeners();
  }

  List<String> getShoppingCartItems() {
    return shoppingCart.map((product) => product.productName).toList();
  }

  String getShoppingCartItemsAsString() {
    return shoppingCart.map((product) => product.productName).join(', ');
  }

  String getShoppingCartPricesAsString() {
    return shoppingCart.map((product) => product.productPrice).join(', ');
  }

  int getItemCount() {
    return shoppingCart.length;
  }

  double getCartTotal() {
    double totalPrice = 0;
    for (Product item in shoppingCart) {
      totalPrice += item.productPrice;
    }
    return totalPrice;
  }

  void clearOrders() {
    for (Product item in shoppingCart) {
      shoppingCart.remove(item);
    }
  }

  List<Product> favoritesItems = [];

  void addFoodToFavs(Product product) {
    favoritesItems.add(product);
    notifyListeners();
  }

  void deleteFoodFromFavs(Product product) {
    favoritesItems.remove(product);
    notifyListeners();
  }

  bool isItemFav(Product product) {
    return favoritesItems.contains(product);
  }

}
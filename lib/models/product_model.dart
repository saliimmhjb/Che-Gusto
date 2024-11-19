import 'package:backend_shop/models/supplement_model.dart';

class Product {
  final double productRating;
  final String productImage;
  final String productName;
  final double productPrice;
  final String productDesc;
  final bool isItFavorite;
  final List<Supplement> foodSupplements;

  Product({required this.productRating, required this.productImage, required this.productName, required this.productPrice, this.isItFavorite = false, this.productDesc = 'N/A', required this.foodSupplements});
}
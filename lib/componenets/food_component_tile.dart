import 'package:backend_shop/models/supplement_model.dart';
import 'package:flutter/material.dart';

class FoodComponenetTile extends StatelessWidget {
  final Supplement supplement;

  const FoodComponenetTile(
      {super.key, required this.supplement, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.04),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              supplement.supplementImage,
              width: 33,
            ),
            const SizedBox(width: 8,),
            Text(
              supplement.supplementName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}

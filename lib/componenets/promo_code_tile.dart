import 'package:backend_shop/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromoCodeTile extends StatefulWidget {
  const PromoCodeTile({super.key});

  @override
  State<PromoCodeTile> createState() => _PromoCodeTileState();
}

class _PromoCodeTileState extends State<PromoCodeTile> {
  TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        CupertinoIcons.ticket,
        size: 28,
      ),
      title: TextField(
        controller: promoCodeController,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: const InputDecoration(
          hintText: 'Promo code',
          border: InputBorder.none,
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          if (promoCodeController.text == 'noneDEV') {
            promoCodeController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Center(
                  child: Text('Your promo code has been applied!'),
                ),
              ),
            );
          } else {
            promoCodeController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                content: Center(
                  child: Text('Your promo code is not valid!'),
                ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: kBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Apply',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

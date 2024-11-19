import 'package:backend_shop/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchBarTile extends StatelessWidget {
  const SearchBarTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 27),
      color: kBgColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        side: BorderSide(color: kBlackColor.withOpacity(0.2)),
      ),
      child: const ListTile(
        leading: Icon(
          Icons.search,
          size: 34,
          color: kBlackColor,
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search your food ...',
            border: InputBorder.none,

          ),
        ),
      ),
    );
  }
}

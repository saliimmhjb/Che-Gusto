import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
        //       print('asd');
        //     },
        //     child: const Icon(Icons.arrow_back_ios),
        //   ),
        // ),
        title: const Text(
          'Credits',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.warning_amber,
                size: 120,
                color: kPrimaryColor,
              ),
              Text(
                textAlign: TextAlign.center,
                "CHE GUSTO is a learning project by developer MAHJOUB Salim, offering a simulated shopping experience without payment features and including backend features. It's designed for educational purposes, allowing users to explore a virtual resturant interface safely.",
                style: Theme.of(context)
                    .textTheme
                    .overline!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kBlackColor,
                      foregroundColor: kBgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const ShopScreen(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I UNDERSTAND',
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 20,
                              color: kBgColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Icon(
                          Icons.check_box,
                          color: kBgColor,
                          size: 23,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:backend_shop/screens/login_screen.dart';
import 'package:backend_shop/screens/shop_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ShopScreen();
          }
          else {
            return const LoginScreen();
          }
        }
      ),
    );
  }
}

import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/core/auth_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isRememeberMeSelected = false;
  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerPassword = TextEditingController();
  TextEditingController registerConfirmedPassword = TextEditingController();
  TextEditingController registerUsername = TextEditingController();

  @override
  void registerUser() async {
    final _authService = AuthService();
    if (registerEmail.text.isNotEmpty) {
      if (registerPassword.text.isEmpty ||
          registerConfirmedPassword.text.isEmpty) {
        showMessage('Fields cannot be empty!');
      } else {
        if (registerPassword.text != registerConfirmedPassword.text) {
          showMessage("Passwords dosen't match!");
        } else {
          try {
            await _authService.signUnWithEmailAndPassword(
              registerEmail.text,
              registerConfirmedPassword.text,
              registerUsername.text,
            );
            registerPassword.clear();
            registerUsername.clear();
            registerEmail.clear();
            registerConfirmedPassword.clear();
            registerEmail.clear();
            showMessage('Account created successfully!');
            Navigator.of(context).pop();
          } catch (e) {
            showMessage(e.toString());
          }
        }
      }
    } else {
      showMessage("Email address can't be empty");
    }
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kPrimaryColor,
        content: Center(child: Text(msg)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Che Gusto',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const Text(
              'Italian Food',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: registerUsername,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: registerEmail,
                decoration: InputDecoration(
                  hintText: 'E-mail address',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(11)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: registerPassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(11)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: registerConfirmedPassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(11)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlackColor.withOpacity(0.9),
                    foregroundColor: kBgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: kBlackColor.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: kBlackColor.withOpacity(0.9),
                        )),
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.g_mobiledata,
                      size: 45,
                    ),
                    title: Text(
                      'Sign up with Google',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 38),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

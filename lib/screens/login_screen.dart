import 'package:backend_shop/constants/colors.dart';
import 'package:backend_shop/core/auth_core.dart';
import 'package:backend_shop/screens/register_screen.dart';
import 'package:backend_shop/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememeberMeSelected = false;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  @override
  void loginUser() async {
    final _authService = AuthService();
    if (loginEmail.text.isEmpty || loginPassword.text.isEmpty) {
      showMessage('Fields cannot be empty!');
    } else {
      try {
        await _authService.signInWithEmailAndPassword(
            loginEmail.text, loginPassword.text);
        //loginEmail.clear();
        loginPassword.clear();
        showMessage('You log in successfully!');
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return ShopScreen();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      } catch (e) {
        showMessage(e.toString());
      }
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
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: loginEmail,
                decoration: InputDecoration(
                  hintText: 'E-mail address',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: loginPassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(11)),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isRememeberMeSelected = !isRememeberMeSelected;
                          });
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: kBlackColor.withOpacity(0.6),
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.close,
                            color: isRememeberMeSelected
                                ? kBlackColor
                                : kBlackColor.withOpacity(0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const Text(
                    'Forgot password?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlackColor.withOpacity(0.9),
                    foregroundColor: kBgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
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
                      'Sign in with Google',
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
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
                  'Not a member yet?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation1,
                            Animation<double> animation2) {
                          return const RegisterScreen();
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
                    'Sign up',
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

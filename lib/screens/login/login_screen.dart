import 'package:date_app/main.dart';
import 'package:date_app/widgets/condition_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = false;

  Future<UserCredential?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void loginWithGoogle() async {
    setState(() {
      _isLogin = true;
    });
    await GoogleSignIn().signOut();
    UserCredential? userCredential = await _signInWithGoogle();
    if (userCredential!.user!.emailVerified) {
      _isLogin = false;
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const BottomNavApp(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/welcome.png'),
              const SizedBox(height: 20),
              SizedBox(
                width: 2 * width / 3,
                child: Text(
                  'Let’s meeting new people around you',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge,
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _CustomButton(
                        color: colorScheme.primary,
                        width: width,
                        onClick: () {},
                        icon: Icons.phone_in_talk_outlined,
                        child: Text(
                          'Login with Phone',
                          style: textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      _CustomButton(
                          color: colorScheme.onSecondary,
                          width: width,
                          onClick: loginWithGoogle,
                          icon: Icons.gpp_good,
                          child: ConditionWidget(
                            condition: _isLogin,
                            tWidget: const SizedBox(
                              height: 20,
                              width: 20,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                            fWidget: Text(
                              'Login with Google',
                              style: textTheme.titleMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Don’t have account?'),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Text(
                              "Sign up",
                              style: textTheme.titleSmall!.copyWith(
                                color: colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

class _CustomButton extends StatelessWidget {
  final Color color;
  final double width;
  final Widget child;
  final IconData icon;
  final Function() onClick;

  const _CustomButton({
    required this.color,
    required this.width,
    required this.child,
    required this.onClick,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color,
      ),
      child: TextButton(
        onPressed: onClick,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              height: 40,
              width: 40,
              child: Icon(
                icon,
                size: 25,
              ),
            ),
            Container(
              width: (2 * width / 3) - 20,
              alignment: Alignment.center,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

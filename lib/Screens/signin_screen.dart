import 'package:flutter/material.dart';
import 'package:sanctuarysend/Layout/Signup_layout/signupmobi_layout.dart';
import 'package:sanctuarysend/Responsive/signin_breakpoint.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _AdminState();
}

class _AdminState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SigninResponsiveLayout(mobileLayout: SignIn(), desktopLayout: SignUpMobi()),
    );
  }
}

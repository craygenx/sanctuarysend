import 'package:flutter/material.dart';
import 'package:sanctuarysend/Layout/Signup_layout/signupdesktop_layout.dart';
import 'package:sanctuarysend/Layout/Signup_layout/signupmobi_layout.dart';
import 'package:sanctuarysend/Responsive/signup_breakpoint.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _AdminState();
}

class _AdminState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupResponsiveLayout(mobileLayout: SignUpDesktop(), desktopLayout: SignUpMobi()),
    );
  }
}
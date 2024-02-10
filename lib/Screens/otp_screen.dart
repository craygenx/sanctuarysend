import 'package:flutter/material.dart';
import 'package:sanctuarysend/Layout/Otp_layout/otpdesktop_layout.dart';
import 'package:sanctuarysend/Layout/Otp_layout/otpmobi_layout.dart';
import 'package:sanctuarysend/Layout/Signup_layout/signupdesktop_layout.dart';
import 'package:sanctuarysend/Layout/Signup_layout/signupmobi_layout.dart';
import 'package:sanctuarysend/Responsive/signin_breakpoint.dart';

import '../Responsive/otp_breakpoint.dart';


class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _AdminState();
}

class _AdminState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OtpResponsiveLayout(mobileLayout: OtpScreenMobi(), desktopLayout: OtpDesktop()),
    );
  }
}

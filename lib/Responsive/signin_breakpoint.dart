import 'package:flutter/material.dart';

class SigninResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget desktopLayout;

  const SigninResponsiveLayout({super.key, required this.mobileLayout, required this.desktopLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth < 600){
          return mobileLayout;
        }else{
          return desktopLayout;
        }
      },
    );
  }
}
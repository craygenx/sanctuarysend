import 'package:flutter/material.dart';

class BreakdownResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget desktopLayout;

  const BreakdownResponsiveLayout({super.key, required this.mobileLayout, required this.desktopLayout});

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
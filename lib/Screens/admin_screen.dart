import 'package:flutter/material.dart';
import 'package:sanctuarysend/Layout/Admin_layout/adminDesktop_layout.dart';
import 'package:sanctuarysend/Layout/Admin_layout/adminMobi_layout.dart';
import 'package:sanctuarysend/Responsive/admin_breakpoint.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AdminResponsiveLayout(mobileLayout: AdminMobiLayout(), desktopLayout: AdminDesktopLayout()),
    );
  }
}

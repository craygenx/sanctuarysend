import 'package:flutter/material.dart';

class CustomMainAppbar extends StatefulWidget implements PreferredSizeWidget{
  const CustomMainAppbar({super.key});

  @override
  State<CustomMainAppbar> createState() => _AppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<CustomMainAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.account_circle_sharp))
        ],
      ),
    );
  }
}
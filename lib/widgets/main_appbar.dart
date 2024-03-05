import 'package:flutter/material.dart';
import 'package:sanctuarysend/widgets/registration_popup.dart';

class CustomMainAppbar extends StatefulWidget implements PreferredSizeWidget{
  const CustomMainAppbar({super.key});

  @override
  State<CustomMainAppbar> createState() => _AppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<CustomMainAppbar> {

  void _showRegistrationPopup(BuildContext context) {
    showDialog(context: context,
        builder: (BuildContext context) {
          return RegistrationPopupDialog();
        }
    );
  }
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
              onPressed: (){
                _showRegistrationPopup(context);
              },
              icon: const Icon(Icons.person_add_alt_1))
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sanctuarysend/Firebase/auth_service.dart';
import 'package:sanctuarysend/widgets/custom_bold_txt.dart';
import 'package:sanctuarysend/widgets/dropdown_filter.dart';

class CustomPopupDialog extends StatefulWidget {
  const CustomPopupDialog({super.key});

  @override
  State<CustomPopupDialog> createState() => _CustomPopupDialogState();
}

class _CustomPopupDialogState extends State<CustomPopupDialog> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    // bool isLoading = false;
    String churchName = '';
    AuthService authService = AuthService();

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const BoldText(text: 'Church Registration Form', fontSize: 22.0),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
            child: MyDropdown(
              onItemSelected: (String selectedItem) {
                churchName = selectedItem;
              },
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Assign Admin Email', // Label text
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 5.0),
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.black), // Black border line
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'JohnDoe@gmail.com', // Hint text
                        border: InputBorder.none, // Remove default border
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextFormField(
                readOnly: true, // Set readOnly property to true
                initialValue: 'Admin', // Set initial value
                decoration: const InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(),
                ),
              )),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () {
              // setState(() {
              //   isLoading = true;
              // });
              authService.registerChurch(
                  churchName, emailController.text, '1104802171', context);
              authService.sendChurchEmail(emailController.text);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
            ),
            child: const BoldText(text: 'Register Church'))
      ],
    );
  }
}

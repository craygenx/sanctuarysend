import 'package:flutter/material.dart';
import 'package:sanctuarysend/widgets/custom_bold_txt.dart';
import 'package:sanctuarysend/widgets/dropdown_filter.dart';

class CustomPopupDialog extends StatelessWidget {
  final TextEditingController textFieldController1 = TextEditingController();
  final TextEditingController textFieldController2 = TextEditingController();

  CustomPopupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Custom Popup Dialog'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const BoldText(text: 'Church Registration Form'),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
            child: MyDropdown(),
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      decoration: InputDecoration(
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
          ElevatedButton(
              onPressed: () {}, child: const BoldText(text: 'Register Church'))
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const BoldText(text: 'Register Church'))
      ],
    );
  }
}

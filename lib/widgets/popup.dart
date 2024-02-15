import 'package:flutter/material.dart';

class CustomPopupDialog extends StatelessWidget {
  const CustomPopupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: AlertDialog(
        title: const Text('Add new Vote'),
        content: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter title',
              )
            ),
            const TextField(
                decoration: InputDecoration(
                  labelText: 'Allocation amount',
                )
            ),
            const TextField(
                decoration: InputDecoration(
                  labelText: 'Account number',
                )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: (){},
                  child: const Text('Add')),
            )
          ],
        ),
      ),
    );
  }
}

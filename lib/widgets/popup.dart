import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sanctuarysend/Firebase/voteModel.dart';
import 'package:uuid/uuid.dart';

class CustomPopupDialog extends StatelessWidget {
  CustomPopupDialog({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(8.0),
        title: const Text('Add new Vote'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Enter title',
              )
            ),
            TextField(
              controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Allocation amount',
                )
            ),
            TextField(
              controller: accountController,
                decoration: const InputDecoration(
                  labelText: 'Account number',
                )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () async{
                    final VoteModel voteModel = VoteModel(title: titleController.text, amount: amountController.text, accNumber: accountController.text, deficit: '', timeSent: DateTime.now());
                    await FirebaseFirestore.instance.collection('votes').doc(uuid.v1()).set(voteModel.toMap());
                  },
                  child: const Text('Add')),
            )
          ],
        ),
      ),
    );
  }
}

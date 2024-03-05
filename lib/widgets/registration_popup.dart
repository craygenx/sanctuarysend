import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class RegistrationPopupDialog extends StatelessWidget {
  RegistrationPopupDialog({super.key});
  final TextEditingController emailController = TextEditingController();
  final uuid = const Uuid();

  void sendEmail(String receiverEmail) async{

    const String apiUrl = 'https://backendsystem-rjgw.onrender.com/send_deeplink';
    String deepLink = "sanctuarysend://registration?email=$receiverEmail";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> requestData = {
      'receiver_email': receiverEmail,
      'deeplink': deepLink,
    };

    try {
      final response = await http.post(
          Uri.parse(apiUrl),
          headers: headers,
          body: jsonEncode(requestData)
      );
      if(response.statusCode == 200) {
        print('successful');
        emailController.text = '';
      }else{
        print('failed');
      }
    }catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(8.0),
        title: const Text('Add new Member'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter Email',
                )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () async{
                    sendEmail(emailController.text);
                  },
                  child: const Text('Add')),
            )
          ],
        ),
      ),
    );
  }
}

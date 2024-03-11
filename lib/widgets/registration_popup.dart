import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'custom_dropdown.dart';

class RegistrationPopupDialog extends StatefulWidget {
  const RegistrationPopupDialog({super.key});

  @override
  State<RegistrationPopupDialog> createState() => _RegistrationPopupDialogState();
}

class _RegistrationPopupDialogState extends State<RegistrationPopupDialog> {
  final TextEditingController emailController = TextEditingController();

  final List<String> categories = ['Pastor', 'Accountant'];

  String selectedCategory = '';

  final uuid = const Uuid();

  bool isButtonDisabled = false;

  void sendEmail(String receiverEmail) async{

    const String apiUrl = 'https://backendsystem-rjgw.onrender.com/send_deeplink';
    String deepLink = "https://sanctuarysend.onrender.com/#/registration?email=$receiverEmail&role=$selectedCategory";
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
        emailController.text = '';
        Fluttertoast.showToast(
          msg: 'Email sent successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.black,
          fontSize: 22.0,
        );
      }else{
        Fluttertoast.showToast(
          msg: 'Email sending failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.black,
          fontSize: 22.0,
        );
      }
    }catch (e) {
      Fluttertoast.showToast(
        msg: 'Error occurred',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 22.0,
      );
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
            Expanded(
              child: SizedBox(
                child: CategoryDropdown(
                  categories: categories,
                  onChanged: (String value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () async{
                    setState(() {
                      isButtonDisabled = true;
                    });
                    if(isButtonDisabled || selectedCategory == '' || emailController.text == ''){
                    }else{
                      sendEmail(emailController.text);
                      setState(() {
                        isButtonDisabled = false;
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: isButtonDisabled ? const CircularProgressIndicator() : const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:sanctuarysend/Firebase/church_model.dart';
import 'package:sanctuarysend/widgets/custom_popup.dart';
import 'package:uuid/uuid.dart';

class AuthService {
  final uuid = const Uuid();

  String _generateRandomOTP() {
    Random random = Random();
    int code = 1000 + random.nextInt(9000);
    return code.toString();
  }

  void storeOTP(String email, String otp) async {
    await FirebaseFirestore.instance
        .collection('otpCollection')
        .doc(email)
        .set({
      'userEmail': email,
      'otp': otp,
      'timestamp': ServerValue.timestamp,
    });
    // DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    // databaseReference.child('otpCollection').push().set({
    //   'userEmail' : email,
    //   'otp' : otp,
    //   'timestamp' : ServerValue.timestamp,
    // });
  }

  Future<String?> retrieveOTP(String email) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('otpCollection')
          .doc(email)
          .get();
      if (documentSnapshot.exists) {
        return documentSnapshot['otp'];
      } else {
        return null;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Failed to retrieve OTP',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 22.0,
      );
    }
    return null;
  }

  void verifyOtp(String email, String enteredOtp) async {
    String? storedOTP = await retrieveOTP(email);

    if (storedOTP != null && storedOTP == enteredOtp) {
      Fluttertoast.showToast(
        msg: 'Authentication successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 22.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'OTP verification failed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 22.0,
      );
    }
  }

  void sendEmail(String receiverEmail) async {
    const String apiUrl = 'https://backendsystem-rjgw.onrender.com/send_email';
    String otp = _generateRandomOTP();

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> requestData = {
      'receiver_email': receiverEmail,
      'message': 'Your OTP is $otp',
    };

    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: jsonEncode(requestData));
      if (response.statusCode == 200) {
        storeOTP(receiverEmail, otp);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Email sent successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 22.0,
      );
    }
  }

  void registerChurch(
      String name, String email, String accNo, BuildContext context) async {
    try {
      ChurchModel churchModel = ChurchModel(
          name: name,
          assignedAdminEmail: email,
          accNumber: accNo,
          registeredAt: DateTime.now());
      await FirebaseFirestore.instance
          .collection('registeredChurches')
          .doc(uuid.v1())
          .set(churchModel.toMap());
      CustomToast.show(context, 'Success!', type: ToastType.success);
    } catch (_) {
      CustomToast.show(context, 'Error!', type: ToastType.error);
    }
  }

  void sendChurchEmail(String receiverEmail) async {
    const String apiUrl =
        'https://backendsystem-rjgw.onrender.com/send_deeplink';
    String deepLink =
        "https://sanctuarysend.onrender.com/#/registration?email=$receiverEmail&role=Admin";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> requestData = {
      'receiver_email': receiverEmail,
      'deeplink': deepLink,
    };

    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: jsonEncode(requestData));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: 'Email sent successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.black,
          fontSize: 22.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Email sending failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.black,
          fontSize: 22.0,
        );
      }
    } catch (e) {
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
}

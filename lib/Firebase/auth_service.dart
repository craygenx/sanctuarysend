import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

class AuthService {

  String _generateRandomOTP(){
  Random random = Random();
  int code = 1000 + random.nextInt(9000);
  return code.toString();
  }

  void storeOTP(String email, String otp) async{
    await FirebaseFirestore.instance.collection('otpCollection').doc(email).set({
      'userEmail' : email,
      'otp' : otp,
      'timestamp' : ServerValue.timestamp,
    });
    // DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    // databaseReference.child('otpCollection').push().set({
    //   'userEmail' : email,
    //   'otp' : otp,
    //   'timestamp' : ServerValue.timestamp,
    // });
  }

  Future<String?> retrieveOTP(String email) async{
    try{
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('otpCollection').doc(email).get();
      if (documentSnapshot.exists){
        return documentSnapshot['otp'];
      }else{
        return null;
      }
    }catch (e){
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

  void verifyOtp(String email, String enteredOtp) async{
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
    }else{
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


  void sendEmail(String receiverEmail) async{
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
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(requestData)
      );
      if(response.statusCode == 200) {
        storeOTP(receiverEmail, otp);
      }
    }catch (e) {
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
}

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

class AuthService {

  String _generateRandomOTP(){
  Random random = Random();
  int code = 1000 + random.nextInt(9000);
  return code.toString();
  }

  void storeOTP(String email, String otp) {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('otpCollection').push().set({
      'userEmail' : email,
      'otp' : otp,
      'timestamp' : ServerValue.timestamp,
    });
  }

  Future<String?> retrieveOTP(String email) async{
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    DataSnapshot snapshot = (await databaseReference.child('otpCollection')
        .orderByChild('userEmail').equalTo(email).limitToLast(1).once()) as DataSnapshot;
    if (snapshot.value != null){
      Map<dynamic, dynamic>? otpData = snapshot.value as Map?;
      String storedOtp = otpData?.values.first['otp'];
      return storedOtp;
    }else{
      return null;
    }
  }

  void verifyOtp(String email, String enteredOtp) async{
    String? storedOTP = await retrieveOTP(email);

    if (storedOTP != null && storedOTP == enteredOtp) {
      print('authentication successful');
    }else{
      print('OTP verification failed');
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
      print(response.statusCode);
      if(response.statusCode == 200) {
        storeOTP(receiverEmail, otp);
        print('successful');
      }else{
        print('failed');
      }
    }catch (e) {
      print(e);
      print('fuck');
    }
  }
}

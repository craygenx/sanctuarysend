import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanctuarysend/Firebase/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Responsive/admin_breakpoint.dart';
import '../../widgets/custom_bold_txt.dart';
import '../../widgets/initial_appbar.dart';
import '../../widgets/otp_fields.dart';
import '../Admin_layout/adminDesktop_layout.dart';
import '../Admin_layout/adminMobi_layout.dart';

class OtpDesktop extends StatefulWidget {
  const OtpDesktop({super.key});

  @override
  State<OtpDesktop> createState() => _OtpDesktopState();
}

class _OtpDesktopState extends State<OtpDesktop> {
  bool isEmailValid = false;
  int _resendTimeout = 60; // seconds
  late Timer _timer;
  bool isOtpSent = false;
  bool isUserFound = false;
  bool isVerifying = false;
  TextEditingController mailController = TextEditingController();
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  _saveToLocalStorage(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  void checkEmail(String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        String fName = doc['fName'];
        String lName = doc['lName'];

        _saveToLocalStorage('$fName $lName');
        setState(() {
          isUserFound = true;
        });
      }
    } else {
      Fluttertoast.showToast(
        msg: 'User not found!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 22.0,
      );
    }
  }

  bool otpComplete() {
    return OtpFieldsState.isComplete;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimeout > 0) {
        setState(() {
          _resendTimeout--;
        });
      } else {
        _timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  void resendOtp() {
    setState(() {
      _resendTimeout = 60;
    });
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  String? validateEmail(String value) {
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return 'null';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 1 / 3,
                    width: MediaQuery.of(context).size.height * 1 / 3,
                    child: Image.network(
                        'https://backendsystem-rjgw.onrender.com/image/regra.jpg'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                color: const Color.fromRGBO(242, 250, 253, 1),
                // height: MediaQuery.of(context).size.height / 1/2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1 / 3,
                      child: Column(
                        children: [
                          const SizedBox(
                            child: Center(
                                child: BoldText(
                              text: 'VERIFICATION',
                              fontSize: 18.0,
                            )),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: BoldText(
                                text:
                                    'Lorem ipsum dolor sit amet conjecture anglicising elite. Maxime Lolita'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Icon(Icons.email),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextFormField(
                                        controller: mailController,
                                        onChanged: (value) {
                                          setState(() {
                                            isEmailValid =
                                                validateEmail(value) == 'null';
                                          });
                                        },
                                        decoration: const InputDecoration(
                                            hintText: 'JohnDoe@gmail.com',
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Icon(
                                    Icons.verified_user,
                                    color: isEmailValid
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 1 / 3,
                                  height: 150,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        child: Center(
                                          child: OtpFields(),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          child: isOtpSent
                                              ? ElevatedButton(
                                                  onPressed: () {
                                                    if (otpComplete() &&
                                                        isVerifying == false) {
                                                      String mergedOtp = '';
                                                      for (TextEditingController controller
                                                          in OtpFieldsState
                                                              .controllers) {
                                                        mergedOtp +=
                                                            controller.text;
                                                      }
                                                      authService.verifyOtp(
                                                          mailController.text,
                                                          mergedOtp);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => const AdminResponsiveLayout(
                                                                  mobileLayout:
                                                                      AdminMobiLayout(),
                                                                  desktopLayout:
                                                                      AdminDesktopLayout())));
                                                    }
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors
                                                          .deepPurpleAccent,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0))),
                                                  child: const BoldText(
                                                    text: 'VERIFY',
                                                    fontSize: 18.0,
                                                  ),
                                                )
                                              : ElevatedButton(
                                                  onPressed: () async {
                                                    checkEmail(
                                                        mailController.text);
                                                    if (isEmailValid &&
                                                        mailController
                                                            .text.isNotEmpty &&
                                                        isUserFound) {
                                                      authService.sendEmail(
                                                          mailController.text);
                                                      setState(() {
                                                        isOtpSent = true;
                                                      });
                                                      startTimer();
                                                    } else {
                                                      print(isUserFound);
                                                    }
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors
                                                          .deepPurpleAccent,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0))),
                                                  child: isVerifying
                                                      ? const CircularProgressIndicator()
                                                      : const BoldText(
                                                          text: 'SEND OTP',
                                                          fontSize: 18.0,
                                                        ),
                                                ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'Re-send code in ',
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: _resendTimeout == 0
                                                  ? 'Resend'
                                                  : '$_resendTimeout s',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  if (_resendTimeout == 0) {
                                                    resendOtp();
                                                  }
                                                })
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sanctuarysend/Layout/Admin_layout/adminDesktop_layout.dart';
import 'package:sanctuarysend/Layout/Admin_layout/adminMobi_layout.dart';
import 'package:sanctuarysend/Responsive/admin_breakpoint.dart';

import '../../widgets/custom_bold_txt.dart';
import '../../widgets/initial_appbar.dart';
import '../../widgets/otp_fields.dart';

class OtpScreenMobi extends StatefulWidget {
  const OtpScreenMobi({super.key});

  @override
  State<OtpScreenMobi> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreenMobi> {
  bool isFocused = false;
  bool isOtpComplete = false;
  int _resendTimeout = 60; // seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
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

  bool otpComplete() {
    return OtpFieldsState.isComplete;
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/regra.jpg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: BoldText(text: 'VERIFICATION', fontSize: 18.0,),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: BoldText(
                text: 'Lorem ipsum dolor sit amet conjecture anglicising elite. Maxime Lolita',
                fontSize: 16.0,fontWeight:  FontWeight.normal,
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(242, 250, 253, 0)
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          child: Center(
                            child: OtpFields(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width  * 3/4,
                            child: ElevatedButton(
                              onPressed: (){
                                if(otpComplete()){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminResponsiveLayout(mobileLayout: AdminMobiLayout(), desktopLayout: AdminDesktopLayout())));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurpleAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)
                                  )
                              ),
                              child: const BoldText(text: 'VERIFY', fontSize: 18.0,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: RichText(text: TextSpan(
                        text: 'Re-send code in ',
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: _resendTimeout == 0 ? 'Resend' : '$_resendTimeout s',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              if (_resendTimeout == 0) {
                                resendOtp();
                              }
                              }
                          )
                        ]
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
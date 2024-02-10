import 'package:flutter/material.dart';
import 'package:sanctuarysend/Layout/Otp_layout/otpdesktop_layout.dart';
import 'package:sanctuarysend/Layout/Otp_layout/otpmobi_layout.dart';
import 'package:sanctuarysend/Responsive/otp_breakpoint.dart';

import '../../widgets/custom_bold_txt.dart';
import '../../widgets/initial_appbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/regra.jpg')
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: BoldText(text: 'SIGN IN', fontSize: 22.0,),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: BoldText(
                text: 'Lorem ipsum dolor sit amet conjecture anglicising elite. Maxime Lolita',
                fontSize: 16.0,fontWeight:  FontWeight.normal,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.cyanAccent
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.email),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 3/4,
                          child: const TextField(
                            decoration: InputDecoration(
                                hintText: 'JohnDoe@gmail.com',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                )
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(Icons.verified_user),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 3/4,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpResponsiveLayout(mobileLayout: OtpScreenMobi(), desktopLayout: OtpDesktop())));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            )
                        ),
                        child: const BoldText(text: 'SEND OTP', fontSize: 22.0,),
                      ),
                    ),
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
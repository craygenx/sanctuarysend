import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sanctuarysend/Firebase/auth_service.dart';

import '../../Responsive/otp_breakpoint.dart';
import '../../widgets/custom_bold_txt.dart';
import '../../widgets/initial_appbar.dart';
import '../Otp_layout/otpdesktop_layout.dart';
import '../Otp_layout/otpmobi_layout.dart';

class SignIn extends StatefulWidget {
  final FluroRouter router;
  const SignIn({super.key, required this.router});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController mailController = TextEditingController();
  AuthService authService = AuthService();
  bool isEmailValid = false;

  String? validateEmail(String value) {
    // Define a regular expression for a valid email
    final RegExp emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    // Check if the entered email matches the regex
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    // Return null if the email is valid
    return 'null';
  }

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
                  child: Image.asset('assets/regra.jpg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: BoldText(
                text: 'SIGN IN',
                fontSize: 18.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: BoldText(
                text:
                    'Lorem ipsum dolor sit amet conjecture anglicising elite. Maxime Lolita',
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(242, 250, 253, 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.email),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 3 / 4,
                            child: TextFormField(
                              controller: mailController,
                              onChanged: (value){
                                setState(() {
                                  isEmailValid = validateEmail(value) == 'null';
                                });
                              },
                              decoration: const InputDecoration(
                                  hintText: 'JohnDoe@gmail.com',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.verified_user,
                              color: isEmailValid ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 3 / 4,
                        child: ElevatedButton(
                          onPressed: () {
                            widget.router.navigateTo(context, '/registration?email=marshalldennis27@gmail.com&role=pastor');
                            // if (isEmailValid && mailController.text.isNotEmpty){
                            //   authService.sendEmail(mailController.text);
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //           OtpResponsiveLayout(
                            //               mobileLayout: OtpScreenMobi(email: mailController.text,),
                            //               desktopLayout: const OtpDesktop(),
                            //           ),
                            //       ),
                            //   );
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          child: const BoldText(
                            text: 'SEND OTP',
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

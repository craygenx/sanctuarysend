import 'package:flutter/material.dart';

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
                    height: MediaQuery.of(context).size.width * 1/3,
                    width: MediaQuery.of(context).size.height * 1/3,
                    child: Image.asset('assets/regra.jpg',
                      fit: BoxFit.fill
                    ),
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
                      width: MediaQuery.of(context).size.width / 1/3,
                      child: Column(
                        children: [
                          const SizedBox(
                            child: Center(child: BoldText(text: 'VERIFICATION', fontSize: 18.0,)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: BoldText(text: 'Lorem ipsum dolor sit amet conjecture anglicising elite. Maxime Lolita'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width /2,
                            height: 100,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Icon(Icons.email),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                                    child: SizedBox(
                                      width: 100,
                                      child: TextField(
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
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Icon(Icons.verified_user),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 1/3,
                                  height: 150,
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
                                          width: MediaQuery.of(context).size.width /4,
                                          child: ElevatedButton(
                                            onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminResponsiveLayout(mobileLayout: AdminMobiLayout(), desktopLayout: AdminDesktopLayout())));
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
                                  child: RichText(text: const TextSpan(
                                      text: 'Re-send code in ',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '0:38',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
import 'package:flutter/material.dart';

import '../../widgets/custom_bold_txt.dart';
import '../../widgets/initial_appbar.dart';

class SignUpDesktop extends StatefulWidget {
  final String email;
  final String role;
  const SignUpDesktop({super.key, required this.email, required this.role});

  @override
  State<SignUpDesktop> createState() => _SignUpDesktopState();
}

class _SignUpDesktopState extends State<SignUpDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1/4,
                    height: MediaQuery.of(context).size.height * 1/4,
                    child: Image.network('https://backendsystem-rjgw.onrender.com/image/regra.jpg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1/3,
                color: const Color.fromRGBO(242, 250, 253, 1),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          child: Center(child: BoldText(text: 'SIGNUP', fontSize: 24,)),
                        ),
                        const SizedBox(
                          child: BoldText(
                            text: 'Lorem ipsum dolor sit amet conjecture anglicising elite. Maxime Lolita',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: const BoxDecoration(
                              color: Colors.cyanAccent
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: SizedBox(
                                  // padding: const EdgeInsets.all(16.0),
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 8.0, bottom: 15, right: 4.0),
                                              child: SizedBox(
                                                height: 50,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      hintText: 'LastName',
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
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 8.0, bottom: 15.0, left: 4.0),
                                              child: SizedBox(
                                                height: 50,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      hintText: 'FirstName',
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
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 4.0),
                                              child: SizedBox(
                                                height: 50,
                                                child: TextField(
                                                  readOnly: true,
                                                  controller: TextEditingController(text: widget.email),
                                                  decoration: const InputDecoration(
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
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 4.0),
                                              child: SizedBox(
                                                height: 50,
                                                child: TextField(
                                                  readOnly: true,
                                                  controller: TextEditingController(text: widget.role),
                                                  decoration: const InputDecoration(
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 3/4,
                                child: ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurpleAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0)
                                      )
                                  ),
                                  child: const BoldText(text: 'SEND OTP', fontSize: 22.0,),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
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
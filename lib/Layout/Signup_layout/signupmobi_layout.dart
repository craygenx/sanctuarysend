import 'package:flutter/material.dart';

import '../../widgets/custom_bold_txt.dart';
import '../../widgets/initial_appbar.dart';

class SignUpMobi extends StatelessWidget {
  final String email;
  const SignUpMobi({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/regra.jpg')
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: BoldText(text: 'SIGN UP', fontSize: 18.0,),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: BoldText(
                text: 'Lorem ipsum dolor sit amet conjecture anglicising elite. Maxime Lolita',
                fontSize: 16.0,fontWeight:  FontWeight.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(242, 250, 253, 1)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: SizedBox(
                        // padding: const EdgeInsets.all(16.0),
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 1.0,
                          children: [
                            SizedBox(
                              height: 30,
                              child: TextField(
                                readOnly: true,
                                controller: TextEditingController(text: email),
                                decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                        )
                                    )
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
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
                            SizedBox(
                              height: 30,
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
                            SizedBox(
                              height: 30,
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
                        child: const BoldText(text: 'SEND OTP', fontSize: 18.0,),
                      ),
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../Firebase/registrationModel.dart';
import '../../widgets/custom_bold_txt.dart';
import '../../widgets/initial_appbar.dart';

class SignUpMobi extends StatelessWidget {
  final String email;
  final String role;
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final  uuid = const Uuid();

  SignUpMobi({super.key, required this.email, required this.role});

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
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      child: TextField(
                                        readOnly: true,
                                        controller: TextEditingController(text: role),
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
                        onPressed: () async{
                          RegistrationModel registrationModel = RegistrationModel(fName: fNameController.text, lName: lNameController.text, email: email, role: role, createdAt: DateTime.now());
                          await FirebaseFirestore.instance.collection('payments').doc(uuid.v1()).set(registrationModel.toMap());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            )
                        ),
                        child: const BoldText(text: 'REGISTER', fontSize: 18.0,),
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
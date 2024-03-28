import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanctuarysend/Layout/Admin_layout/adminDesktop_layout.dart';
import 'package:sanctuarysend/Layout/Admin_layout/adminMobi_layout.dart';
import 'package:sanctuarysend/Responsive/admin_breakpoint.dart';
import 'package:uuid/uuid.dart';

import '../../Firebase/registrationModel.dart';
import '../../widgets/custom_bold_txt.dart';
import '../../widgets/initial_appbar.dart';

class SignUpMobi extends StatefulWidget {
  final String email;
  final String role;

  const SignUpMobi({super.key, required this.email, required this.role});

  @override
  State<SignUpMobi> createState() => _SignUpMobiState();
}

class _SignUpMobiState extends State<SignUpMobi> {
  final TextEditingController fNameController = TextEditingController();

  final TextEditingController lNameController = TextEditingController();

  final uuid = const Uuid();

  bool isButtonDisabled = false;

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
                  child: Image.network(
                      'https://backendsystem-rjgw.onrender.com/image/regra.jpg')),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: BoldText(
                text: 'SIGN UP',
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
                height: 250,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(242, 250, 253, 1)),
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
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 15, right: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      child: TextField(
                                        controller: lNameController,
                                        decoration: const InputDecoration(
                                            hintText: 'LastName',
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 15.0, left: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      child: TextField(
                                        controller: fNameController,
                                        decoration: const InputDecoration(
                                            hintText: 'FirstName',
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
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
                                        controller: TextEditingController(
                                            text: widget.email),
                                        decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
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
                                        controller: TextEditingController(
                                            text: widget.role),
                                        decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
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
                      width: MediaQuery.of(context).size.width * 3 / 4,
                      child: isButtonDisabled
                          ? const Center(
                              child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: CircularProgressIndicator()),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isButtonDisabled = true;
                                });
                                RegistrationModel registrationModel =
                                    RegistrationModel(
                                        fName: fNameController.text,
                                        lName: lNameController.text,
                                        email: widget.email,
                                        role: widget.role,
                                        createdAt: DateTime.now());
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(uuid.v1())
                                    .set(registrationModel.toMap());
                                Fluttertoast.showToast(
                                  msg: 'Registration successful',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Colors.greenAccent,
                                  textColor: Colors.black,
                                  fontSize: 22.0,
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AdminResponsiveLayout(
                                                mobileLayout: AdminMobiLayout(),
                                                desktopLayout:
                                                    AdminDesktopLayout())));
                                setState(() {
                                  isButtonDisabled = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurpleAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              child: const BoldText(
                                text: 'REGISTER',
                                fontSize: 18.0,
                              ),
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

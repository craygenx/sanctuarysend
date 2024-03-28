import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sanctuarysend/Firebase/auth_service.dart';
import 'package:sanctuarysend/widgets/custom_bold_txt.dart';
import 'package:sanctuarysend/widgets/custom_bottomsheet.dart';
import 'package:sanctuarysend/widgets/dropdown_filter.dart';

class RegistrationMobi extends StatefulWidget {
  final FluroRouter router;
  const RegistrationMobi({super.key, required this.router});

  @override
  State<RegistrationMobi> createState() => _RegistrationMobiState();
}

class _RegistrationMobiState extends State<RegistrationMobi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBottomSheet(context, widget.router));
  }
}

Widget buildBottomSheet(BuildContext context, FluroRouter router) {
  TextEditingController emailController = TextEditingController();
  final AuthService authService = AuthService();
  String churchName = '';
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          'https://backendsystem-rjgw.onrender.com/image/chrch.jpg',
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
            child: BoldText(
          text: 'Sanctuary Send',
          fontSize: 30,
        )),
        const SizedBox(
          width: 30.0,
          child: Divider(
            thickness: 2.0,
            color: Colors.deepPurpleAccent,
          ),
        ),
        const BoldText(
          text: 'Embracing Faith, Building Community, Serving All.',
          fontWeight: FontWeight.normal,
          fontSize: 22,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // width: MediaQuery.of(context).size.width * 1 / 4,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomBottomSheet(
                              height: 320.0, // Adjust height as needed
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const BoldText(
                                        text: 'Church Registration Form'),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, bottom: 10.0),
                                      child: MyDropdown(
                                        onItemSelected: (String selectedItem) {
                                          churchName = selectedItem;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Assign Admin Email', // Label text
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          const SizedBox(height: 5.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors
                                                      .black), // Black border line
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: TextField(
                                                controller: emailController,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      'JohnDoe@gmail.com', // Hint text
                                                  border: InputBorder
                                                      .none, // Remove default border
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: TextFormField(
                                          readOnly:
                                              true, // Set readOnly property to true
                                          initialValue:
                                              'Admin', // Set initial value
                                          decoration: const InputDecoration(
                                            labelText: 'Role',
                                            border: OutlineInputBorder(),
                                          ),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          authService.registerChurch(
                                              churchName,
                                              emailController.text,
                                              '1104802171',
                                              context);
                                          authService.sendChurchEmail(
                                              emailController.text);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.deepPurpleAccent,
                                        ),
                                        child: const BoldText(
                                            text: 'Register Church'))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    child: const BoldText(text: "Register Church"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2.0,
                          color: Colors.deepPurpleAccent), // Border color
                      borderRadius: BorderRadius.circular(
                          15.0), // Optional: border radius
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 1 / 4,
                      child: ElevatedButton(
                        onPressed: () {
                          router.navigateTo(context, '/signin');
                        },
                        child: const BoldText(text: "SignIn"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

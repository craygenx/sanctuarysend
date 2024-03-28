import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sanctuarysend/widgets/church_reg_popup.dart';
import 'package:sanctuarysend/widgets/custom_bold_txt.dart';

class RegistrationDesktop extends StatelessWidget {
  final FluroRouter router;
  const RegistrationDesktop({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
            child: BoldText(
          text: 'Sanctuary Send',
          fontSize: 30,
        )),
        const SizedBox(
          width: 30.0,
          child: Divider(
            thickness: 4.0,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomPopupDialog();
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    child: const BoldText(
                      text: 'Register Church',
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.0,
                        color: Colors.deepPurpleAccent), // Border color
                    borderRadius:
                        BorderRadius.circular(15.0), // Optional: border radius
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      router.navigateTo(context, '/signin');
                    },
                    child: const BoldText(
                      text: 'SignIn',
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    ));
  }
}

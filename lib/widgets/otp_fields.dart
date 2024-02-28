import 'package:flutter/material.dart';

class OtpFields extends StatefulWidget {
  // final VoidCallback onLastFieldFilled;
  const OtpFields({super.key});

  @override
  State<OtpFields> createState() => OtpFieldsState();
}

class OtpFieldsState extends State<OtpFields> {
  List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  static bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) => Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          color: Colors.white,
          width: 45,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: controllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: '0',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: focusNodes[index].hasFocus ? Colors.black : Colors.grey, width: 3.0),
                )
            ),
            onChanged: (value){
              if (value.length == 1 && index < 3){
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              }else if (index == 3 && value.length == 1) {
                setState(() {
                  isComplete = true;
                });
              }
            },
            onTap: (){
              setState(() {
                focusNodes[index].requestFocus();
              });
            },
            focusNode: focusNodes[index],
          ),
        ),
      )),
    );
  }
}
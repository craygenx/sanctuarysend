import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sanctuarysend/widgets/custom_bold_txt.dart';

import '../../widgets/main_appbar.dart';

class PaymentDesktopLayout extends StatefulWidget {
  const PaymentDesktopLayout({super.key});

  @override
  State<PaymentDesktopLayout> createState() => _PaymentDesktopLayoutState();
}

class _PaymentDesktopLayoutState extends State<PaymentDesktopLayout> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMainAppbar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Colors.pink,
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 1/2,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // const BoldText(text: 'Payment'),
                  SizedBox(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: SizedBox(
                            width: 300,
                            height: 300,
                            child: Placeholder(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Expanded(child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(
                                      color: Colors.black
                                    )
                                  ),
                                  // color: Colors.purple,
                                  child: const BoldText(text: 'Cash'),
                                )),
                                Expanded(child: Container(
                                  height: 50,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      )
                                  ),
                                  child: const BoldText(text: 'Mobile Money'),
                                )),
                              ],
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: .75,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:  Colors.black,
                                    width: 1.0,
                                  )
                                ),
                                // color: Colors.blueGrey,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.zero)
                                    )
                                  ),
                                ),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: .75,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  )
                                ),
                                child: const BoldText( text: 'Send Payment',)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 1/2,
              // color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: FaIcon(FontAwesomeIcons.sackDollar),
                          ),
                          BoldText(text: 'Ksh: 20000.00', fontSize: 22,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BoldText(text: 'Payment Info', fontSize: 22,),
                        const Text('payment method'),
                        SizedBox(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                      value: 1,
                                      groupValue: selectedValue,
                                      onChanged: (value){
                                        setState(() {
                                          selectedValue = value!;
                                        });
                                      }),
                                  const BoldText(text: 'Mobile Money'),
                                ],
                              ),

                              Row(
                                children: [
                                  Radio(
                                      value: 2,
                                      groupValue: selectedValue,
                                      onChanged: (value){
                                        setState(() {
                                          selectedValue = value!;
                                        });
                                      }),
                                  const BoldText(text: 'Cash'),
                                ],
                              ),

                            ],
                          ),
                        ),
                        // const BoldText(text: "Sender's Account Name"),
                        const Text("Sender's Account Name"),
                        // const BoldText(text: 'John Doe'),
                        const Text('John Doe',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          child: Column(
                            children: [
                              BoldText(text: 'BreakDown', fontSize: 22,),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BoldText(text: 'Mothers Union', fontWeight: FontWeight.normal, fontSize: 18,),
                                    BoldText(text: '3,000.00', fontSize: 22,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

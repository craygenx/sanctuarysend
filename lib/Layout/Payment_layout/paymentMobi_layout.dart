import 'package:flutter/material.dart';

import '../../widgets/custom_bold_txt.dart';
import '../../widgets/main_appbar.dart';

class PaymentMobiLayout extends StatefulWidget {
  const PaymentMobiLayout({super.key});

  @override
  State<PaymentMobiLayout> createState() => _PaymentMobiLayoutState();
}

class _PaymentMobiLayoutState extends State<PaymentMobiLayout> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMainAppbar(),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Column(
                children: [
                  const BoldText(text: 'Payment'),
                  SizedBox(
                    child: Column(
                      children: [
                        const SizedBox(
                          child: Row(
                            children: [
                              Icon(Icons.monetization_on_outlined),
                              BoldText(text: 'Ksh: 20000.00')
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Expanded(child: Container(
                                height: 40,
                                color: Colors.purple,
                                child: const BoldText(text: 'Cash'),
                              )),
                              Expanded(child: Container(
                                height: 40,
                                color: Colors.red,
                                child: const BoldText(text: 'Mobile Money'),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
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
                        ElevatedButton(
                            onPressed: (){},
                            child: const BoldText( text: 'Send Payment',)),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const BoldText(text: 'Payment Info'),
                              const BoldText(text: 'payment method'),
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
                              const BoldText(text: "Sender's Account Name"),
                              const BoldText(text: 'John Doe'),
                              const SizedBox(
                                child: Column(
                                  children: [
                                    BoldText(text: 'BreakDown'),
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          BoldText(text: 'Mothers Union'),
                                          BoldText(text: '3,000.00')
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
          ],
        ),
      ),
    );
  }
}

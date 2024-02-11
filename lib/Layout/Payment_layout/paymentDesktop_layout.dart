import 'package:flutter/material.dart';
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.pink,
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 1/2,
              color: Colors.blue,
              child: Column(
                children: [
                  const BoldText(text: 'Payment'),
                  SizedBox(
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 300,
                          height: 300,
                          child: Placeholder(),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Expanded(child: Container(
                                color: Colors.purple,
                                child: const BoldText(text: 'Cash'),
                              )),
                              Expanded(child: Container(
                                color: Colors.red,
                                child: const BoldText(text: 'Mobile Money'),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          width: 200,
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
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 1/2,
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
    );
  }
}

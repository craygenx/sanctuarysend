import 'package:flutter/material.dart';
import 'package:sanctuarysend/widgets/custom_bold_txt.dart';

class BreakdownDesktop extends StatefulWidget {
  const BreakdownDesktop({super.key});

  @override
  State<BreakdownDesktop> createState() => _BreakdownDesktopState();
}

class _BreakdownDesktopState extends State<BreakdownDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Row(
                children: [
                  Container(
                    color: Colors.blue,
                    child: const Text('hello mf'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .25,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          color: Colors.red,
                          child: const Column(
                            children: [
                              BoldText(
                                text: 'Latest Transaction',
                              ),
                              Row(
                                children: [
                                  BoldText(text: 'Ksh: 8000.00'),
                                  Icon(Icons.arrow_circle_right),
                                  Text('28%')
                                ],
                              ),
                              BoldText(
                                  text:
                                      'Comparison with ksh:12000 prev. transaction.')
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          color: Colors.purple,
                          child: const Column(
                            children: [
                              BoldText(
                                text: 'Total Transactions',
                              ),
                              Row(
                                children: [
                                  BoldText(text: '24'),
                                  Icon(Icons.arrow_circle_right),
                                  Text('28%')
                                ],
                              ),
                              BoldText(
                                  text:
                                      'Comparison with prev. month transactions.')
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 150,
                          color: Colors.pink,
                          child: const Column(
                            children: [
                              BoldText(
                                text: 'Total Contributed',
                              ),
                              Row(
                                children: [
                                  BoldText(text: 'Ksh: 8000.00'),
                                  Icon(Icons.arrow_circle_right),
                                  Text('28%')
                                ],
                              ),
                              BoldText(
                                  text:
                                      'Comparison with ksh: 24000 prev. Contribution.')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 150,
              child: Column(
                children: [
                  Container(
                    color: Colors.brown,
                  ),
                  Container(
                    color: Colors.deepOrange,
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

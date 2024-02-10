import 'package:flutter/material.dart';

import '../../widgets/custom_bold_txt.dart';
import '../../widgets/main_appbar.dart';

class AdminDesktopLayout extends StatefulWidget {
  const AdminDesktopLayout({super.key});

  @override
  State<AdminDesktopLayout> createState() => _AdminDesktopLayoutState();
}

class _AdminDesktopLayoutState extends State<AdminDesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMainAppbar(),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 3/4,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1/2,
                        color: Colors.white,
                        // child: Image.asset('assets/pie.jpg'),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: SizedBox(
                        height: 130,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const BoldText(text: 'CATEGORIES', fontSize: 22,),
                                  SizedBox(
                                    width: 150,
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 15.0),
                                          child: IconButton(onPressed: (){},
                                            icon: const Icon(Icons.file_open_rounded),
                                          ),
                                        ),
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey
                                          ),
                                          child: const Center(
                                            child: Icon(
                                                Icons.app_registration
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 100,
                                width: MediaQuery.of(context).size.width * 3/4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 50,
                                      color: Colors.grey,
                                      child: const Row(
                                        children: [
                                          Icon(Icons.favorite,
                                            size: 22,
                                          ),
                                          BoldText(text: 'ThanksGiving',
                                          )
                                        ],
                                      ),

                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      color: Colors.grey,
                                      child: const Row(
                                        children: [
                                          Icon(Icons.money_sharp),
                                          BoldText(text: 'ThanksGiving')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      color: Colors.grey,
                                      child: const Row(
                                        children: [
                                          Icon(Icons.money_outlined,
                                            size: 22,
                                          ),
                                          BoldText(text: 'Tithe')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 50,
                                      color: Colors.grey,
                                      child: const Row(
                                        children: [
                                          Icon(Icons.attach_money_sharp,
                                            size: 22,
                                          ),
                                          BoldText(text: 'Miscellaneous')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: SizedBox(
                        child: Column(
                          children: [
                            const SizedBox(
                              child: BoldText(text: 'Services'),
                            ),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 3/4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 25,
                                              height: 25,
                                              decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(Icons.account_circle),
                                            ),
                                            Positioned(
                                              left: 15,
                                              child: Container(
                                                width: 25,
                                                height: 25,
                                                decoration: const BoxDecoration(
                                                  color: Colors.grey,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(Icons.supervisor_account),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  BoldText(text: 'Morning Service'),
                                                  BoldText(text: ' .in-progress', fontWeight: FontWeight.normal,)
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  BoldText(text: 'Lead Pastor: '),
                                                  BoldText(text: 'Peter Griffin')
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    child: Text('2h ago',
                                      style: TextStyle(
                                          color: Colors.blueGrey
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SingleChildScrollview(),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width * 1/4,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                const BoldText(text: 'Ksh: 0.00', fontSize: 30.0, fontWeight: FontWeight.w900,),
                                const Expanded(
                                  child: SizedBox(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          child: Column(
                                            children: [
                                              Icon(Icons.money_outlined),
                                              BoldText(text: 'Expenses')
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: Column(
                                            children: [
                                              Icon(Icons.money),
                                              BoldText(text: 'Top-Up')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.calendar_month_outlined),
                                          ],
                                        ),
                                      ),
                                      const Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          BoldText(text: '24 Jan 2024'),
                                          BoldText(text: '18% more than last month'),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width * 1/4,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_month_outlined),
                                      BoldText(text: 'Events')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Row(
                                          children: [
                                            Icon(Icons.edit_calendar),
                                            BoldText(text: '09 Feb')
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Row(
                                          children: [
                                            Icon(Icons.access_time_filled_outlined),
                                            BoldText(text: '10:15 AM')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 1/4,
                                    height: 100,
                                    child: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Leadership Summit 2024',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text('Lorem ipsum dolor sit amet conjecture anglicising elite. Maxime Lolita dolor sit amet conjecture anglicising',
                                          maxLines: 3,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        // BoldText(text: 'Lorem ipsum dolor sit amet conjecture anglicising elite. Maxime Lolita dolor sit amet conjecture anglicising')
                                      ],
                                    )
                                )
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
          )
      ),
    );
  }
}
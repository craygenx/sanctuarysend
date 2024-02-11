import 'package:flutter/material.dart';

import '../../widgets/custom_bold_txt.dart';
import '../../widgets/main_appbar.dart';

class AdminMobiLayout extends StatefulWidget {
  const AdminMobiLayout({super.key});

  @override
  State<AdminMobiLayout> createState() => _AdminState();
}

class _AdminState extends State<AdminMobiLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMainAppbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1/4,
                  child: Image.asset('assets/pie.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: BoldText(text: 'CATEGORIES', fontSize: 16,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: SizedBox(
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
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(16.0),
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15.0),
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            color: Colors.grey,
                                            width: 170,
                                            height: 40,
                                            child: const Row(
                                              children: [
                                                Icon(Icons.favorite),
                                                BoldText(text: 'ThanksGiving')
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.grey,
                                            width: 170,
                                            height: 40,
                                            child: const Row(
                                              children: [
                                                Icon(Icons.money_sharp),
                                                BoldText(text: 'ThanksGiving')
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          color: Colors.grey,
                                          width: 170,
                                          height: 40,
                                          child: const Row(
                                            children: [
                                              Icon(Icons.money_outlined),
                                              BoldText(text: 'Tithe')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          width: 170,
                                          height: 40,
                                          child: const Row(
                                            children: [
                                              Icon(Icons.attach_money_sharp),
                                              BoldText(text: 'Miscellaneous')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: const Column(
                    children: [
                      DefaultTabController(
                        length: 2,
                        child: TabBar(
                          tabs: [
                            Tab(child: Row(
                              children: [
                                Icon(Icons.people_alt),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: BoldText(text: 'Services', fontSize: 16,),
                                )
                              ],
                            ),),
                            Tab(child: Row(
                              children: [
                                Icon(Icons.event_sharp),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: BoldText(text: 'Events', fontSize: 16,),
                                )
                              ],
                            ),
                            ),
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
    );
  }
}

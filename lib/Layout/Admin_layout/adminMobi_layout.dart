import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sanctuarysend/Layout/Payment_layout/paymentDesktop_layout.dart';
import 'package:sanctuarysend/Layout/Payment_layout/paymentMobi_layout.dart';
import 'package:sanctuarysend/Layout/pdf_docs_layout/pdf_desktop_layout.dart';
import 'package:sanctuarysend/Layout/pdf_docs_layout/pdf_mobile_doc.dart';
import 'package:sanctuarysend/Responsive/payment_breakpoint.dart';
import 'package:sanctuarysend/widgets/popup.dart';

import '../../Responsive/pdf_docs_breakpoint.dart';
import '../../widgets/custom_bold_txt.dart';
import '../../widgets/main_appbar.dart';
import '../../widgets/syncfusionCharts.dart';

class AdminMobiLayout extends StatefulWidget {
  const AdminMobiLayout({super.key});

  @override
  State<AdminMobiLayout> createState() => _AdminState();
}

class _AdminState extends State<AdminMobiLayout> {

  String fDate = '';
  double balance = 0.0;
  final CollectionReference archiveBalance = FirebaseFirestore.instance.collection('balance');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeFormat();
  }

  void timeFormat(){

    DateTime date = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy').format(date);

    setState(() {
      fDate = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomMainAppbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentResponsiveLayout(mobileLayout: PaymentMobiLayout(), desktopLayout: PaymentDesktopLayout())));
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1/3,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 3/4,
                        child: const SyncfusionCustomRadiusPieChart(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  color: const Color.fromRGBO(242, 250, 253, 1),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: SizedBox(
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(text: fDate),
                            const BoldText(text: '18% more than last month'),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                                      child: IconButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PdfDocResponsiveLayout(mobileLayout: PdfMobiLayout(), desktopLayout: PdfDocDesktopLayout(),)));
                                      },
                                        icon: const Icon(Icons.file_open_rounded),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        _showPopup(context);
                                      },
                                      child: Container(
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
                                            color: const Color.fromRGBO(242, 250, 253, 1),
                                            width: 170,
                                            height: 40,
                                            child: const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(right: 10.0),
                                                  child: FaIcon(FontAwesomeIcons.handHoldingHeart),
                                                ),
                                                BoldText(text: 'ThanksGiving')
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: const Color.fromRGBO(242, 250, 253, 1),
                                            width: 170,
                                            height: 40,
                                            child: const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(right: 10.0),
                                                  child: FaIcon(FontAwesomeIcons.handHoldingDollar),
                                                ),
                                                BoldText(text: 'Offering')
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
                                          color: const Color.fromRGBO(242, 250, 253, 1),
                                          width: 170,
                                          height: 40,
                                          child: const Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(right: 10.0),
                                                child: FaIcon(FontAwesomeIcons.envelopeOpen),
                                              ),
                                              BoldText(text: 'Tithe')
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: const Color.fromRGBO(242, 250, 253, 1),
                                          width: 170,
                                          height: 40,
                                          child: const Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(right: 10.0),
                                                child: FaIcon(FontAwesomeIcons.circleInfo),
                                              ),
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
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      DefaultTabController(
                        length: 2,
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              const TabBar(
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
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Container(
                                      height: 200,
                                      color: const Color.fromRGBO(242, 245, 243, 1),
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
                                          Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: 100,
                                              color: const Color.fromRGBO(242, 250, 253, 1),
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
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: Center(
                                        child: Image.asset('assets/nodt.png'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showPopup(BuildContext context) {
    showDialog(context: context,
        builder: (BuildContext context) {
      return CustomPopupDialog();
        }
        );
  }
}

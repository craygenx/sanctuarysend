import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sanctuarysend/Firebase/balanceModel.dart';
import 'package:uuid/uuid.dart';

import '../../Firebase/paymentModel.dart';
import '../../widgets/custom_bold_txt.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/main_appbar.dart';

class PaymentMobiLayout extends StatefulWidget {
  const PaymentMobiLayout({super.key});

  @override
  State<PaymentMobiLayout> createState() => _PaymentMobiLayoutState();
}

class _PaymentMobiLayoutState extends State<PaymentMobiLayout> {
  int selectedValue = 2;
  double totalAmount = 0.0;
  String paymentMode = 'cash';
  double expectedTotal = 0.0;
  double balance = 0.0;
  String selectedCategory = '';
  var uuid = const Uuid();
  TextEditingController paymentController = TextEditingController();
  final CollectionReference archiveBalance = FirebaseFirestore.instance.collection('balance');
  Map<String, double> categoryAmounts = {};
  List<String> categories = ['ThanksGiving', 'Offering', 'Tithe', 'Rent'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentController.addListener(_updateCategories);
    _fetchCategories();
    _fetchBalance();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    paymentController.dispose();
  }

  void _updateCategories(){
    setState(() {
      totalAmount = double.tryParse(paymentController.text) ?? 0.0;
      _updateDynamicCategories();
      expectedTotal = totalAmount + balance;
    });
  }

  void _updateDynamicCategories(){
    if (categoryAmounts.isNotEmpty) {
      double amountPerCategory = totalAmount / categoryAmounts.length;
      categoryAmounts.forEach((category, _) {
        categoryAmounts[category] = amountPerCategory;
      });
    }
  }

  void _fetchCategories() async{
    QuerySnapshot votesSnapshot = await FirebaseFirestore.instance.collection('votes').get();
    setState(() {
      categoryAmounts = { for (var doc in votesSnapshot.docs) doc['title'] : 0.0 };
    });
  }

  void _fetchBalance() async{
    try {
      var balanceSnapshot = await archiveBalance.doc('balID').get();
      var data = balanceSnapshot.data() as Map<String, dynamic>;
      setState(() {
        balance = double.tryParse(data['newBalance']) ?? 0.0;
      });
    }catch (e) {
      print(e);
    }
  }


  void uploadNewBal() async{
    BalanceModel balanceModel = BalanceModel(prevBalance: balance.toString(), newBalance: expectedTotal.toString(), lastModified: DateTime.now());
    await FirebaseFirestore.instance.collection('balance').doc('balID').set(balanceModel.toMap());
  }

  Future<void> _uploadDataToFirebase(String moneySource) async {
    await FirebaseFirestore.instance.collection('paymentBreakdown').doc(uuid.v1()).set({
      'date': DateTime.now(),
      'moneySource': moneySource,
      'voteAllocation': categoryAmounts,
      'amountDispensed': uuid.v1(),
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMainAppbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const BoldText(text: 'Payment', fontSize: 18),
                    SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Container(
                              color: const Color.fromRGBO(242, 250, 253, 1),
                              height: 50,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                                    child: FaIcon(FontAwesomeIcons.sackDollar),
                                  ),
                                  SizedBox(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          BoldText(text: 'Ksh: $balance', fontSize: 22,),
                                          BoldText(text: '  (Expected new bal. ${expectedTotal.toString()} )', fontWeight: FontWeight.normal,)
                                        ],
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          paymentMode = 'cash';
                                          selectedValue = 2;
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: paymentMode == 'cash' ? Colors.grey : Colors.white,
                                            border: Border.all(
                                                color: Colors.black
                                            )
                                        ),
                                        // color: Colors.purple,
                                        child: const BoldText(text: 'Cash'),
                                      ),
                                    )
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          paymentMode = 'mobile';
                                          selectedValue = 1;
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: paymentMode == 'mobile' ? Colors.grey : Colors.white,
                                            border: Border.all(
                                                color: Colors.black
                                            )
                                        ),
                                        child: const BoldText(text: 'Mobile Money'),
                                      ),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        FractionallySizedBox(
                          widthFactor: .95,
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
                              child: TextField(
                                controller: paymentController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.zero)
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: .95,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: ElevatedButton(
                                onPressed: () async{
                                  PaymentModel paymentModel = PaymentModel(sender: '', amount: double.tryParse(paymentController.text) ?? 0.0, mode: paymentMode, category: selectedCategory, timeSent: DateTime.now());
                                  await FirebaseFirestore.instance.collection('payments').doc(uuid.v1()).set(paymentModel.toMap());
                                  await _uploadDataToFirebase('');
                                  uploadNewBal();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    )
                                ),
                                child: const BoldText( text: 'Send Payment',)),
                          ),
                        ),
                          SizedBox(
                            // height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.yellow,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const BoldText(text: 'Payment Info', fontSize: 18,),
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
                                                        paymentMode = 'mobile';
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
                                                        paymentMode = 'cash';
                                                      });
                                                    }),
                                                const BoldText(text: 'Cash'),
                                              ],
                                            ),
        
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(
                                                child: Column(
                                                  children: [
                                                    Text("Sender's Account Name"),
                                                    Text('John Doe',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 15.0),
                                              child: SizedBox(
                                                child: Column(
                                                  children: [
                                                    const Text("Money Source"),
                                                    CategoryDropdown(
                                                      categories: categories,
                                                      onChanged: (String newValue) {
                                                        setState(() {
                                                          selectedCategory = newValue;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Column(
                                          children: [
                                            const BoldText(text: 'BreakDown', fontSize: 18,),
                                            for (var vote in categoryAmounts.entries) 
                                              SizedBox(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    BoldText(text: vote.key, fontWeight: FontWeight.normal, fontSize: 18,),
                                                    BoldText(text: vote.value.toString(), fontSize: 22,)
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

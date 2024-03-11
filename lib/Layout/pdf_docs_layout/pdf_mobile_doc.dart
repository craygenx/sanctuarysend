import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfMobiLayout extends StatefulWidget {
  const PdfMobiLayout({super.key});

  @override
  State<PdfMobiLayout> createState() => _PdfMobiLayoutState();

}

class _PdfMobiLayoutState extends State<PdfMobiLayout> {
  late DateTime startDate;
  late DateTime endDate;
  PdfViewerController pdfViewerController = PdfViewerController();
  // PDFDocument pdfDocument;

  @override
  void initState() {
    super.initState();
    startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
    endDate = DateTime.now();
  }

  Future<void> _generatePDF() async {
    // Fetch data from Firebase
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('votes')
        .where('timeSent', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
        .where('timeSent', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
        .get();

    // Create PDF document
    final pdf = pw.Document();

    // Add data to PDF
    for (QueryDocumentSnapshot<Map<String, dynamic>> document in querySnapshot.docs) {
      pdf.addPage(pw.Page(
        build: (pw.Context context) => pw.TableHelper.fromTextArray(
          headers: ['Title', 'ACC No', 'Time Sent'],
          data: [
            [document['title'], document['accNumber'], _formatTimestamp(document['timeSent'])],
          ],
        ),
      ));
    }

    // final Uint8List pdfBytes = await pdf.save();
    // final pdfDocument = await PdfDocument.fromMemory(pdfBytes);
    // Save PDF to file
    // final output = await getTemporaryDirectory();
    // final file = File('${output.path}/example.pdf');
    // await file.writeAsBytes(await pdf.save());

    // Open the PDF
    // Implement your PDF viewer or use a package to open PDFs
    // For example, you can use the 'flutter_pdfview' package.
  }

  String _formatTimestamp(Timestamp timestamp) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(timestamp.toDate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Generator'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Start Date:'),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null && pickedDate != startDate) {
                    setState(() {
                      startDate = pickedDate;
                    });
                  }
                },
                child: Text(DateFormat('yyyy-MM-dd').format(startDate)),
              ),
            ],
          ),
          Row(
            children: [
              const Text('End Date:'),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: endDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null && pickedDate != endDate) {
                    setState(() {
                      endDate = pickedDate;
                    });
                  }
                },
                child: Text(DateFormat('yyyy-MM-dd').format(endDate)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _generatePDF,
            child: const Text('Generate PDF'),
          ),
        ],
      ),
    );
  }
}

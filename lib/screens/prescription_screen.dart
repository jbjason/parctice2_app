import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:parctice2_app/screens/prescription_create.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PrescrptionScreen extends StatefulWidget {
  static const routeNNNN = '/prescription-screen';
  const PrescrptionScreen({super.key});
  @override
  State<PrescrptionScreen> createState() => _PrescrptionScreenState();
}

class _PrescrptionScreenState extends State<PrescrptionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PdfPreview(
        allowPrinting: false,
        allowSharing: false,
        canChangeOrientation: false,
        canChangePageFormat: false,
        build: (format) => _generatePdf(size.width * .9, size.height * .9),
      ),
    );
  }

  Future<Uint8List> _generatePdf(double width, double height) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    // final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat(width, height),
        build: (context) {
          final list = PrescriptionCreate().totalList;
          return [
            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Column(
                children: [
                  // doc-info
                  PrescriptionCreate().getDocInfo,
                  pw.SizedBox(height: 20),
                ],
              ),
            ),
            ...List.generate(
              list.length,
              (index) => pw.Padding(
                  padding: const pw.EdgeInsets.all(10), child: list[index]),
            ),
          ];
        },
      ),
    );

    Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
    return pdf.save();
  }

  // List<pw.Widget> _getList(double height, double width) {
  //   final list = [
  //     pw.Container(
  //         height: height * .05, width: width * .3, color: PdfColors.green),
  //     pw.SizedBox(height: 10),
  //     pw.Container(
  //         height: height * .05, width: width * .3, color: PdfColors.green),
  //     pw.SizedBox(height: 10),
  //     pw.Container(
  //         height: height * .05, width: width * .3, color: PdfColors.green),
  //   ];
  //   return list;
  // }
}

import 'dart:typed_data';
import 'package:flutter/material.dart';
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
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat(width, height),
        build: (context) {
          final list = _getList(height, width);
          return [
            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Column(
                children: [
                  _getDocInfo(),
                  pw.SizedBox(
                    width: double.infinity,
                    child: pw.FittedBox(
                      child:
                          pw.Text("Testing", style: pw.TextStyle(font: font)),
                    ),
                  ),
                  pw.SizedBox(height: 20),
                ],
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Column(
                children: [
                  _getDocInfo(),
                  pw.SizedBox(
                    width: double.infinity,
                    child: pw.FittedBox(
                      child:
                          pw.Text("Testing", style: pw.TextStyle(font: font)),
                    ),
                  ),
                  pw.SizedBox(height: 20),
                ],
              ),
            ),
            ...List.generate(list.length, (index) => list[index]),
          ];
        },
      ),
    );

    Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
    return pdf.save();
  }

  List<pw.Widget> _getList(double height, double width) {
    final list = [
      pw.Container(
          height: height * .05, width: width * .3, color: PdfColors.green),
      pw.SizedBox(height: 10),
      pw.Container(
          height: height * .05, width: width * .3, color: PdfColors.green),
      pw.SizedBox(height: 10),
      pw.Container(
          height: height * .05, width: width * .3, color: PdfColors.green),
    ];
    return list;
  }

  pw.Widget _getDocInfo() => pw.Stack(
        children: [
          pw.Positioned(
            right: 0,
            top: -20,
            bottom: 0,
            child: pw.Center(child: pw.FlutterLogo()),
          ),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Dr. Abduallah Al Jubayer',
              ),
              pw.Text("General Medicine"),
              pw.SizedBox(height: 10),
              pw.Text('Dhaka Medical College & Hospital, Dhaka'),
              PatPrescriptionRepo()
                  .getTitleText('Email', 'itisjubayer@gmail.com', context),
              PatPrescriptionRepo()
                  .getTitleText('Cell', '01628430948, 01234567891', context),
              pw.SizedBox(height: 5),
              PatPrescriptionRepo().getTitleText('BMDC', '24569877', context),
              pw.SizedBox(height: 10),
              pw.Divider(thickness: .5),
              pw.Row(
                children: [
                  pw.Expanded(
                    child: PatPrescriptionRepo().getTitleText(
                        'Patient', "Abu Bakar Siddique Talha", context),
                  ),
                  pw.Column(
                    children: [
                      PatPrescriptionRepo().getTitleText('Age', '22', context),
                      pw.SizedBox(height: 5),
                      PatPrescriptionRepo()
                          .getTitleText('Weight', '70kg', context),
                    ],
                  ),
                ],
              ),
              pw.Divider(thickness: .7),
            ],
          ),
        ],
      );
}

class PatPrescriptionRepo {
  pw.RichText getTitleText(String title, String subtitle, BuildContext ctx) {
    return pw.RichText(
      text: pw.TextSpan(
        children: [
          pw.TextSpan(
            text: '$title : ',
            style: const pw.TextStyle(color: PdfColors.blue200),
          ),
          pw.TextSpan(text: subtitle),
        ],
      ),
    );
  }

  pw.Widget getBodytTitle(String title, BuildContext ctx) {
    return pw.Text(
      title,
      style: pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        color: const PdfColor.fromInt(0xFF30BCED),
      ),
    );
  }

  pw.Widget getBodySubtitle(String title, String subtitle, BuildContext ctx) {
    return pw.RichText(
      text: pw.TextSpan(
        children: [
          pw.TextSpan(text: '$title '),
          pw.TextSpan(
            text: subtitle,
            style: const pw.TextStyle(color: PdfColors.blue200),
          ),
        ],
      ),
    );
  }
}

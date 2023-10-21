import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PrescriptionCreate {
  Future<void> createAPrescrption() async {}

  List<pw.Widget> get totalList {
    final List<pw.Widget> totalList = [];
    final chiefComplains = [
      PatChiefComplaint(
        id: DateTime.now().add(const Duration(seconds: 1)).toIso8601String(),
        symptom: "Chest pain & excertain",
        duration: "5 days",
        problem: "Pain",
        comment: "irregular",
      ),
      PatChiefComplaint(
        id: DateTime.now().add(const Duration(seconds: 2)).toIso8601String(),
        symptom: "No Angina",
        duration: "10 days",
        problem: "",
        comment: "",
      ),
      PatChiefComplaint(
        id: DateTime.now().add(const Duration(seconds: 3)).toIso8601String(),
        symptom: "Tiredness",
        duration: "1 month",
        problem: "",
        comment: "Most of the time",
      ),
    ];
    final histories = [
      PatChiefComplaint(
        id: DateTime.now().toIso8601String(),
        symptom: "CUD",
        duration: "5 days",
        problem: "Pain",
        comment: "irregular",
      ),
      PatChiefComplaint(
        id: DateTime.now().toIso8601String(),
        symptom: "HID/CAD",
        duration: "10 days",
        problem: "",
        comment: "",
      ),
      PatChiefComplaint(
        id: DateTime.now().toIso8601String(),
        symptom: "Cholesterol",
        duration: "1 month",
        problem: "",
        comment: "Most of the time",
      ),
    ];
    final diagnosis = [
      PatChiefComplaint(
        id: DateTime.now().toIso8601String(),
        symptom: "Pop smear",
        duration: "",
        problem: "",
        comment: "Pain irregular",
      ),
      PatChiefComplaint(
        id: DateTime.now().toIso8601String(),
        symptom: "Lumber puncture",
        duration: "",
        problem: "",
        comment: "",
      ),
    ];
    final findings = [
      PatChiefComplaint(
        id: DateTime.now().toIso8601String(),
        symptom: "CBC",
        duration: "",
        problem: "",
        comment: "MCV 89.0",
      ),
      PatChiefComplaint(
        id: DateTime.now().toIso8601String(),
        symptom: "Blood grouping",
        duration: "",
        problem: "",
        comment: "B positive",
      ),
      PatChiefComplaint(
        id: DateTime.now().toIso8601String(),
        symptom: "RBC Count",
        duration: "",
        problem: "",
        comment: "4.3-5.7 m",
      ),
    ];
    final medicineList = [
      PatMedicine(
        id: DateTime.now().toIso8601String(),
        medicineName: 'Tab. Pantonix 40mg',
        duration: '১৫ দিন',
        foodGenre: "খাবার আগে",
        shceduleTiming: "১-0-১",
        comment: 'ব্যাথা হলে খাবে',
      ),
      PatMedicine(
        id: DateTime.now().toIso8601String(),
        medicineName: 'Tab. Paranetamol',
        duration: '১০ দিন',
        foodGenre: "খাবার পরে",
        shceduleTiming: "0-0-১",
        comment: '',
      ),
      PatMedicine(
        id: DateTime.now().toIso8601String(),
        medicineName: 'Tab. Pantonix 40mg',
        duration: '২ মাস',
        foodGenre: "খাবার আগে",
        shceduleTiming: "১-১-১",
        comment: 'সমস্যা হলে দ্রুত জানাবে',
      ),
    ];

    for (int i = 0; i < chiefComplains.length; i++) {
      totalList.add(getComplaint(chiefComplains[i]));
    }
    for (int i = 0; i < histories.length; i++) {
      totalList.add(getHistory(histories[i]));
    }
    for (int i = 0; i < medicineList.length; i++) {
      totalList.add(getMedicine(i, medicineList[i]));
    }
    return totalList;
  }

  pw.Widget getComplaint(PatChiefComplaint info) {
    return pw.Column(
      children: [
        getBodyTitle("Chief Complaint *"),
        PrescriptionRepo().getBodySubtitle(
          '~ ${info.symptom}',
          '(for ${info.duration}) ${info.problem} ${info.comment}',
        ),
        getBlankSpace,
      ],
    );
  }

  pw.Widget getHistory(PatChiefComplaint info) {
    return pw.Column(
      children: [
        getBodyTitle("History *"),
        PrescriptionRepo().getBodySubtitle('❏ ${info.symptom}',
            '(for ${info.duration}) ${info.problem} ${info.comment}'),
        getBlankSpace,
      ],
    );
  }

  pw.Widget getMedicine(int i, PatMedicine info) {
    return pw.Column(
      children: [
        getBodyTitle("Medicine(Rx"),
        pw.Text(
          '${i + 1}. ${info.medicineName}',
          style: const pw.TextStyle(fontSize: 11),
        ),
        // scheduleTiming, foodGenre, duration
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            PrescriptionRepo().getBodySubtitle('~', ' ${info.shceduleTiming}'),
            PrescriptionRepo().getBodySubtitle('~', ' ${info.foodGenre}'),
            PrescriptionRepo().getBodySubtitle('~', ' ${info.duration}'),
          ],
        ),
        pw.SizedBox(height: 2),
        // note / comment
        pw.Text(
          'Note:  ${info.comment}',
          style: const pw.TextStyle(color: PdfColors.blue200, fontSize: 8),
        ),
        getBlankSpace,
      ],
    );
  }

  pw.Widget getBodyTitle(String title) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
      child: PrescriptionRepo().getBodytTitle(title),
    );
  }

  pw.Widget get getBlankSpace => pw.SizedBox(height: 25);

  pw.Widget get getDocInfo {
    return pw.Stack(
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
            PrescriptionRepo().getTitleText('Email', 'itisjubayer@gmail.com'),
            PrescriptionRepo().getTitleText('Cell', '01628430948, 01234567891'),
            pw.SizedBox(height: 5),
            PrescriptionRepo().getTitleText('BMDC', '24569877'),
            pw.SizedBox(height: 10),
            pw.Divider(thickness: .5),
            pw.Row(
              children: [
                pw.Expanded(
                  child: PrescriptionRepo()
                      .getTitleText('Patient', "Abu Bakar Siddique Talha"),
                ),
                pw.Column(
                  children: [
                    PrescriptionRepo().getTitleText('Age', '22'),
                    pw.SizedBox(height: 5),
                    PrescriptionRepo().getTitleText('Weight', '70kg'),
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
}

class PrescriptionRepo {
  pw.RichText getTitleText(String title, String subtitle) {
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

  pw.Widget getBodytTitle(String title) {
    return pw.Text(
      title,
      style: pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        color: const PdfColor.fromInt(0xFF30BCED),
      ),
    );
  }

  pw.Widget getBodySubtitle(String title, String subtitle) {
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

class PatChiefComplaint {
  final String id;
  final String symptom;
  final String duration;
  final String problem;
  final String comment;
  const PatChiefComplaint({
    required this.id,
    required this.symptom,
    required this.duration,
    required this.problem,
    required this.comment,
  });
}

class PatFollowUp {
  final DateTime date;
  final String comment;
  const PatFollowUp({required this.date, required this.comment});
}

class PatMedicine {
  final String id;
  final String medicineName;
  final String duration;
  final String foodGenre;
  final String shceduleTiming;
  final String comment;
  PatMedicine({
    required this.id,
    required this.medicineName,
    required this.duration,
    required this.foodGenre,
    required this.shceduleTiming,
    required this.comment,
  });
}

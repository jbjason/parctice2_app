import 'package:flutter/material.dart';
import 'package:parctice2_app/widgets/cm_add_button.dart';
import 'package:parctice2_app/widgets/cm_clock_filed.dart';
import 'package:parctice2_app/widgets/cm_date_field.dart';
import 'package:parctice2_app/widgets/cm_dropdown_field.dart';
import 'package:parctice2_app/widgets/cm_name_email_field.dart';
import 'package:parctice2_app/widgets/cm_repo.dart';

class BookPhotographScreen extends StatefulWidget {
  static const routeName = "/book-photograpgh-screen";
  const BookPhotographScreen({super.key});
  @override
  State<BookPhotographScreen> createState() => _BookPhotographScreenState();
}

class _BookPhotographScreenState extends State<BookPhotographScreen> {
  final _dateField = TextEditingController();
  final _clockField = TextEditingController();
  final _selectedDuration = ValueNotifier<int>(0);
  final _selectedSeason = ValueNotifier<String>("");
  final _selectedPhotoGrapher = ValueNotifier<String>("");
  final _additionalInfo = TextEditingController();
  final _durationList = [
    "15 min",
    "20 min",
    "25 min",
    "30 min",
    "35 min",
    "40 min",
    "45 min",
    "50 min",
    "55 min"
  ];
  final _seasonTypeList = [
    "Portrait Sessions",
    "Lifestyle Sessions",
    "Action Sessions",
    "Studio Sessions",
    "Family Sessions",
    "Event Sessions",
    "Pet-and-OwnerPortraits",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1116),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1116),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: const Text(
          "Book Photograph",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CmRepo().titleText("Select Your Pets"),
              const SizedBox(height: 5),
              const CmAddButton(title: "Add Your Pet"),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CmDateField(
                        title: "Date",
                        label: "Select Date",
                        controller: _dateField),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CmClockField(
                        title: "Time",
                        label: "Select Time",
                        controller: _clockField),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CmRepo().titleText("Duration"),
              const SizedBox(height: 5),
              ValueListenableBuilder(
                valueListenable: _selectedDuration,
                builder: (context, val, _) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      _durationList.length,
                      (index) {
                        final isSelected = _selectedDuration.value == index;
                        return InkWell(
                          onTap: () => _selectedDuration.value = index,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromARGB(26, 99, 99, 99),
                            ),
                            child: Text(
                              _durationList[index],
                              style: TextStyle(
                                color: isSelected
                                    ? const Color(0xFF9D67EF)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CmDropDownField(
                title: "Season",
                dropList: _seasonTypeList,
                selectedVal: _selectedSeason,
                label: "Select Season Type",
              ),
              const SizedBox(height: 20),
              CmDropDownField(
                title: "Photographer",
                dropList: _seasonTypeList,
                selectedVal: _selectedPhotoGrapher,
                label: "Select Your Photographer",
              ),
              const SizedBox(height: 20),
              CmNameEmailField(
                title: "Additional Info",
                controller: _additionalInfo,
                label: "Write here.....",
                readOnly: false,
                maxLines: 3,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF9D67EF)),
                ),
                child: const Center(
                    child: Text(
                  "Book Now",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _clockField.dispose();
    _dateField.dispose();
    _additionalInfo.dispose();
    super.dispose();
  }
}

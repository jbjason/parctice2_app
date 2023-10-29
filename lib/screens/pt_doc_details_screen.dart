import 'package:flutter/material.dart';
import 'package:parctice2_app/constants/constants.dart';
import 'package:parctice2_app/constants/my_dimens.dart';

class PtDocDetailsScreen extends StatelessWidget {
  static const routeName = '/pt-doc-details-screen';
  const PtDocDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedSlot = ValueNotifier<int>(0);
    return Scaffold(
      backgroundColor: MyColor.ashhLight,
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              // appBar
              SliverAppBar(pinned: true, elevation: 10, title: _getTopAppbar),
              // doc-info
              const SliverToBoxAdapter(child: PtDocDetTopContainer()),
              // tab-bars
              const SliverAppBar(
                backgroundColor: MyColor.ashhLight,
                pinned: true,
                automaticallyImplyLeading: false,
                elevation: 10,
                title: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text(
                        'Recent',
                        style: TextStyle(color: MyColor.textColor),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'UpComing',
                        style: TextStyle(color: MyColor.textColor),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'FollowUp',
                        style: TextStyle(color: MyColor.textColor),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'FollowUp2',
                        style: TextStyle(color: MyColor.textColor),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'FollowUp3',
                        style: TextStyle(color: MyColor.textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              const DocDInfoItem1(),
              DocDInfoItem2(selectedSlot: selectedSlot),
              const DocDInfoItem3(),
              const Center(child: Text('FollowUp2')),
              const Center(child: Text('FollowUp3')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const PtDocNavBar(),
    );
  }

  Widget get _getTopAppbar {
    return const Row(
      children: [
        SizedBox(
          height: 8,
          width: 8,
          child: DecoratedBox(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          ),
        ),
        SizedBox(width: 5),
        Text('Active Now'),
        SizedBox(width: 15),
      ],
    );
  }
}

class PtDocDetTopContainer extends StatelessWidget {
  const PtDocDetTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            height: 125,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // img
                Container(
                  width: 125,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.5),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/doctor/doc1.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // title, specialities, place
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sanjida Alam",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      MyDimens().getDoctorCategory("Dentist"),
                      const SizedBox(height: 10),
                      _getSubtitleText('BIDM Hospital, Dhaka', context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Experience, reviews, Location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getSubtitleText('Experience', context),
                  const SizedBox(height: 5),
                  const Text('5+ years'),
                ],
              ),
              Container(height: 35, width: .6, color: const Color(0xFFD6D6D6)),
              Column(
                children: [
                  _getSubtitleText('Reviews', context),
                  const SizedBox(height: 5),
                  const Text('★4.5 (20)'),
                ],
              ),
              const Divider(thickness: .5),
              Container(height: 35, width: .6, color: const Color(0xFFD6D6D6)),
              Column(
                children: [
                  _getSubtitleText('Location', context),
                  const SizedBox(height: 5),
                  const Text('Mirpur, Dhaka'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _getSubtitleText(String title, BuildContext ctx) {
    return Text(
      title,
      style: Theme.of(ctx)
          .textTheme
          .bodyMedium!
          .copyWith(color: const Color(0xFFBDBDBD)),
    );
  }
}

class DocDInfoItem1 extends StatelessWidget {
  const DocDInfoItem1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'I would like to show the world today as an ant sees it and tomorrow as the moon sees it.' *
                  2,
            ),
            const SizedBox(height: 20),
            const Text(
              'Education History',
              style: TextStyle(
                color: MyColor.textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            _getEducationHistory('Diploma in Pharmacy   (2020-2023)'),
            _getEducationHistory('FCPS   (2018-2020)'),
            _getEducationHistory('MBBS   (2015-2018)'),
            const SizedBox(height: 14),
            const Text(
              'Specializations',
              style: TextStyle(
                color: MyColor.textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              children: [
                MyDimens().getDoctorCategory('Heart Sergery'),
                const SizedBox(width: 10),
                MyDimens().getDoctorCategory('Heart Mobility'),
                const SizedBox(width: 10),
                MyDimens().getDoctorCategory('Heart Pumb Ring'),
                const SizedBox(width: 10),
                MyDimens().getDoctorCategory('Heart Pumb Ring'),
                const SizedBox(width: 10),
                MyDimens().getDoctorCategory('Heart Pumb Ring'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getEducationHistory(String title) => Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: MyColor.bluePrimary),
            ),
            const SizedBox(width: 10),
            MyDimens().getSubTitleText(title, MyColor.bluePrimary),
          ],
        ),
      );
}

class DocDInfoItem2 extends StatelessWidget {
  const DocDInfoItem2({required this.selectedSlot, super.key});
  final ValueNotifier<int> selectedSlot;

  @override
  Widget build(BuildContext context) {
    final morningList = ['10:10am', '10:30am', '10:50am', '11:20am', '11:40am'];
    final afterNoonList = ['2:00pm', '2:20pm', '2:40pm'];
    final eveningList = ['7:00pm', '7:30pm', '8:00pm', '8:30pm', '9:00pm'];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // calender

            const SizedBox(height: 25),
            _getSlotTitleAndList('Morning Slots', morningList),
            const SizedBox(height: 25),
            _getSlotTitleAndList('AfterNoon Slots', afterNoonList),
            const SizedBox(height: 25),
            _getSlotTitleAndList('Evening Slots', eveningList),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _getSlotTitleAndList(String title, List<String> slotList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        MyDimens().getTitleText(title, MyColor.bluePrimary),
        // slot list
        Wrap(
          children: List.generate(
            slotList.length,
            (index) => ValueListenableBuilder(
              valueListenable: selectedSlot,
              builder: (context, currentSlot, _) {
                bool slot =
                    title.contains('Morning Slots') && currentSlot == index;
                return InkWell(
                  onTap: () => selectedSlot.value = index,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    margin: const EdgeInsets.only(
                        left: 10, right: 5, top: 10, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: slot ? MyColor.bluePrimary : Colors.white60,
                      // gradient: bodyGradient,
                      boxShadow: MyDimens.bodyShadow,
                    ),
                    child: Text(
                      slotList[index],
                      style: TextStyle(
                        color: slot ? Colors.white : MyColor.bluePrimary,
                        fontWeight: slot ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DocDInfoItem3 extends StatelessWidget {
  const DocDInfoItem3({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * .45;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "2",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan,
                        fontSize: 35,
                      ),
                    ),
                    const Text('★★★★☆'),
                    MyDimens().getSubTitleText('(10)', MyColor.bluePrimary),
                  ],
                ),
                const SizedBox(width: 20),
                Container(
                  width: .7,
                  height: 100,
                  color: Colors.grey[350],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [for (int i = 5; i > 0; i--) Text(getStar(i))],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) {
                        return Container(
                          height: 4,
                          width: width,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(vertical: 9),
                          color: Colors.grey[350],
                          child: Container(
                            width: width / (index + 1),
                            color: Colors.cyan,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...List.generate(
              4,
              (index) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/2.jpg'),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyDimens()
                                .getTitleText("jjjjj", MyColor.bluePrimary),
                            MyDimens()
                                .getSubTitleText('March 21, 2021', Colors.grey),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    MyDimens().getSubTitleText(
                      'I would like to show the world today as an ant sees it and tomorrow as the moon sees it.',
                      Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getStar(int i) => '★' * i + '☆' * (5 - i);
}

class PtDocNavBar extends StatelessWidget {
  const PtDocNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDimens().getButtonStyle(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Fee:  \$${2000}'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white54,
            ),
            child: const Text(
              'Appointment',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ScheduleFragment extends StatefulWidget {
  const ScheduleFragment({super.key});

  @override
  State<ScheduleFragment> createState() => _ScheduleFragmentState();
}

class _ScheduleFragmentState extends State<ScheduleFragment> {
  String statusActive = 'Upcoming Schedule';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(64),
        buildListStatus(),
        Gap(20),
        Expanded(child: buldListDoctor())
      ],
    );
  }

  ListView buldListDoctor() {
    final listDoctor = [
      {
        'image': 'assets/joseph.png',
        'name': 'Dr. Joseph Brostito',
        'specialist': 'Dental Specialist',
        'date': DateTime(2024, 06, 12),
        'range': '11:00 - 19:00 AM',
      },
      {
        'image': 'assets/bessie.png',
        'name': 'Dr. Bessie Coleman',
        'specialist': 'Dental Specialist',
        'date': DateTime(2024, 06, 12),
        'range': '11:00 - 12:00 AM',
      },
      {
        'image': 'assets/babe.png',
        'name': 'Dr. Babe Didrikson',
        'specialist': 'Dental Specialist',
        'date': DateTime(2024, 05, 20),
        'range': '09:00 - 10:00 AM',
      },
    ];
    return ListView.builder(
      itemCount: listDoctor.length,
      padding: const EdgeInsets.all(0),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        Map item = listDoctor[index];
        return Container(
          margin: EdgeInsets.fromLTRB(
            24,
            index == 0 ? 0 : 8,
            24,
            index == 0 ? 0 : 8,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                offset: const Offset(2, 12),
                color: const Color(0xff5A75A7).withOpacity(0.1),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      item['image'],
                      width: 48,
                      height: 48,
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: const Color(0xff0D1B34),
                            height: 1,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          item['specialist'],
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: const Color(0xff8696BB),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(20),
              Divider(
                color: Color(0xffF5F5F5),
                height: 1,
                thickness: 1,
              ),
              Gap(20),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const ImageIcon(
                          AssetImage(
                            'assets/ic_calendar.png',
                          ),
                          size: 16,
                          color: Color(0xff8696BB),
                        ),
                        const Gap(8),
                        Text(
                          DateFormat('EEEE, d MMMM').format(item['date']),
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color(0xff8696BB),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const ImageIcon(
                          AssetImage(
                            'assets/ic_clock.png',
                          ),
                          size: 16,
                          color: Color(0xff8696BB),
                        ),
                        const Gap(8),
                        Text(
                          item['range'],
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Color(0xff8696BB),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(20),
              // button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xff63b4FF).withOpacity(0.1),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Detail',
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff4894fe),
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildListStatus() {
    final list = [
      'Canceled Schedule',
      'Upoming Schedule',
      'Completed Schedule',
    ];

    return SizedBox(
      height: 50.0,
      child: PageView.builder(
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.6,
        ),
        onPageChanged: (currentIndex) {
          // buat pindah2 status
          statusActive = list[currentIndex];
          setState(() {});
        },
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          bool isActive = statusActive == list[index];
          return UnconstrainedBox(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: isActive ? Color(0xff63b4ff).withOpacity(0.1) : null,
                borderRadius: BorderRadius.circular(100),
              ),
              alignment: Alignment.center,
              child: Text(
                list[index],
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(
                    isActive ? 0xff4894fe : 0xff8696bb,
                  ),
                  height: 1,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/admin_meeting/admin_meeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../teacher_section/attendence_section/attendence-Book/attendence_Book_status.dart';
import '../../../../admin_meeting/admin_meeting_list.dart';
import '../../../../admin_notice/admin_notice.dart';
import '../../../../admin_notice/admin_notice_model_list.dart';
import '../../../../teacher_home/widgets/card_container.dart';
import '../../../time_table/time_table_screen.dart';
import '../../constants.dart';

class StudentsHomeHomeScreen extends StatefulWidget {
  var schoolID;
  var classID;
  var studentEmailid;
  StudentsHomeHomeScreen(
      {required this.schoolID,
      required this.classID,
      required this.studentEmailid,
      Key? key})
      : super(key: key);

  @override
  State<StudentsHomeHomeScreen> createState() => _StudentsHomeHomeScreenState();
}

class _StudentsHomeHomeScreenState extends State<StudentsHomeHomeScreen> {
  String studentName = '';
  String studentclass = '';
  String rollNumber = '';
  String studentimage = '';

  late DocumentSnapshot<Map<String, dynamic>> mon;
  late DocumentSnapshot<Map<String, dynamic>> tues;
  late DocumentSnapshot<Map<String, dynamic>> wed;
  late DocumentSnapshot<Map<String, dynamic>> thur;
  late DocumentSnapshot<Map<String, dynamic>> fri;

  void retrieveData() async {
    mon = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Monday')
        .get();
    tues = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Tuesday')
        .get();
    wed = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Wednesday')
        .get();
    thur = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Thursday')
        .get();
    fri = await FirebaseFirestore.instance
        .collection('SchoolListCollection')
        .doc(widget.schoolID)
        .collection('Classes')
        .doc(widget.classID)
        .collection('TimeTables')
        .doc('Friday')
        .get();
  }

  @override
  void initState() {
    getStudentClass();
    getStudentDetails();
    retrieveData();
    super.initState();
  }

  Widget build(BuildContext context) {
    log(studentName);
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: containerColor[1],
                  begin: Alignment.bottomCenter,
                  end: Alignment.centerRight),
            ),
            width: 100.w,
            height: 40.h,
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(
                          studentName: studentName,
                        ),
                        kHalfSizedBox,
                        StudentClass(
                            studentClass:
                                'Class ${studentclass} | Roll no: ${rollNumber}'),
                        kHalfSizedBox,
                        StudentYear(studentYear: '2020-2021'),
                      ],
                    ),
                    kHalfSizedBox,
                    StudentPicture(
                        picAddress: studentimage,
                        onPress: () {
                          // Navigator.pushNamed(
                          //     context, MyProfileScreen.routeName);
                        }),
                  ],
                ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                      onPress: () {},
                      title: 'Attendance'.tr,
                      value: '90.02%',
                    ),
                    StudentDataCard(
                      onPress: () {
                        // Navigator.pushNamed(context, FeeScreen.routeName);
                      },
                      title: 'Fees Due',
                      value: '600\$',
                    ),
                  ],
                )
              ],
            ),
          ),

          //other will use all the remaining height of screen
          Expanded(
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: SingleChildScrollView(
                //for padding
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/Exams.svg',
                          title: 'Exams',
                        ),
                        HomeCard(
                          onPress: () {
                            // Navigator.pushNamed(
                            //     context, AssignmentScreen.routeName);
                          },
                          icon: 'assets/icons/assignment.svg',
                          title: 'Assignments',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/homework.svg',
                          title: 'HomeWork',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => TimeTablePage(
                                          classID: widget.classID,
                                          schoolID: widget.schoolID,
                                          mon: mon,
                                          tues: tues,
                                          wed: wed,
                                          thurs: thur,
                                          fri: fri,
                                        ))));
                          },
                          icon: 'assets/icons/timetable.svg',
                          title: 'Time Table',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/teacher.svg',
                          title: 'Teachers ',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/subject.svg',
                          title: 'Subjects',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/result.svg',
                          title: 'Result',
                        ),
                        HomeCard(
                          onPress: () {
                            // Navigator.pushNamed(
                            //     context, DateSheetScreen.routeName);
                          },
                          icon: 'assets/icons/project.svg',
                          title: 'Projects',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/materials.svg',
                          title: 'Study \n Materials',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/class.svg',
                          title: 'Special \n Classes',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/live.svg',
                          title: 'Live Classes',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/record.svg',
                          title: 'Recorded \n Classes',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Get.to(AttendenceBookScreen(
                                schoolId: widget.schoolID,
                                classID: widget.classID));
                          },
                          icon: 'assets/icons/attendence.svg',
                          title: 'Attendence',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/progressreport.svg',
                          title: 'Progress\n Report',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/achieve.svg',
                          title: 'Achievement',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/Schoalrship.svg',
                          title: 'ScholarShip',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/holiday.svg',
                          title: 'School\n Calender',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/instruction.svg',
                          title: 'General \n Instruction',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/days.svg',
                          title: 'Important \n Days',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return AdminNoticeModelList(
                                schoolId: widget.schoolID,
                                fromPage: 'visibleStudent',
                              );
                            }));
                          },
                          icon: 'assets/icons/notices.svg',
                          title: 'Notices',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/ask.svg',
                          title: 'Complaints & \nSuggetions ',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/Fees.svg',
                          title: 'Fees',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/resume.svg',
                          title: 'Leave\nApplication',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/event.svg',
                          title: 'Events',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminMeetingModelList(
                                  schoolId: widget.schoolID,
                                ),
                              ),
                            );
                          },
                          icon: 'assets/icons/event.svg',
                          title: 'Meetings'.tr,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getStudentDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Classes")
        .doc(widget.classID)
        .collection("Students")
        .doc(widget.studentEmailid)
        .get();
    setState(() {
      studentName = vari.data()!['studentName'];
      rollNumber = vari.data()!['rollNo'];
      studentimage = vari.data()!['studentImage'];
    });
    log(vari.toString());
  }

  getStudentClass() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Classes")
        .doc(widget.classID)
        .get();
    setState(() {
      studentclass = vari.data()!['className'];
    });
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 40.w,
        height: 20.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: containerColor[1],
              begin: Alignment.bottomCenter,
              end: Alignment.centerRight),
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}

final containerColor = [
  [Color(0xff6448fe), Color(0xff5fc6ff)],
  [Color(0xFF26A69A), Color.fromARGB(255, 40, 167, 154)],
  [Color(0xfffe6197), Color(0xffffb463)],
  [Color.fromARGB(255, 30, 196, 30), Color.fromARGB(255, 79, 163, 30)],
  [Color.fromARGB(255, 116, 130, 255), Color.fromARGB(255, 86, 74, 117)],
  [Color.fromARGB(248, 55, 30, 66), Color.fromARGB(248, 122, 40, 161)],
  [Color.fromARGB(255, 208, 104, 105), Color.fromARGB(255, 241, 66, 66)],
  [
    Color.fromARGB(248, 69, 4, 100),
    Color.fromARGB(255, 95, 2, 138),
  ],
  [Color(0xFF26A69A), Color(0xFF26A69A)]
];

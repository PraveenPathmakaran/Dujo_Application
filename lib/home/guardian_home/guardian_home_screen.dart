import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


import '../../teacher_section/attendence_section/attendence-Book/attendence_Book_status.dart';
import '../student_home/Students_sections/constants.dart';
import '../teacher_home/widgets/card_container.dart';

class GuardianHomeScreen extends StatefulWidget {
    var schoolId;
  var classId;
  var guardianmailId;
  
   GuardianHomeScreen({
    required this.schoolId,
    required this.classId,
    required this.guardianmailId,
    super.key});
  static String routeName = 'GuardianHome';

  @override
  State<GuardianHomeScreen> createState() => _GuardianHomeScreenState();
}

class _GuardianHomeScreenState extends State<GuardianHomeScreen> {
  String gurdianName ='';
  String studentName='';
  String gurdianImage="";
  String studentID="";
  @override
  void initState() {
getParentDetails().then((value) => getstudentDetails());
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100.w,
            height: 50.h,
            padding:  EdgeInsets.all(kDefaultPadding),
            child: ListView(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          ParentName(
                            parentName: 'Guardian',
                          ),
                          kHalfSizedBox,
                  
                          kHalfSizedBox,
                          StudentClass(studentClass: gurdianName),
                          kHalfSizedBox,
                        ],
                      ),
                      kHalfSizedBox,
                      StudentPicture(
                          picAddress:gurdianImage,
                          onPress: () {
               
                          }),
                    ],
                  ),
                ),

                sizedBox,
                Column(
                  children: [
                    StudentDataCard(
                      onPress: () {},
                      title: 'Student Name',
                      value: studentName,
                    ),
                  ],
                ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                      onPress: () {},
                      title: 'Attendance',
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
                physics: const BouncingScrollPhysics(),
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
                          onPress: () {},
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
                                schoolId: widget.schoolId,
                                classID: widget.classId));
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
                          onPress: () {},
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future <void> getParentDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolId)
        .collection("Student_Guardian")
        .doc(widget.guardianmailId)
        .get();
    setState(() {
      gurdianName = vari.data()!['guardianName'];
          gurdianImage = vari.data()!['guardianImage'];
            studentID = vari.data()!['wStudent'];



    });

  }
    getstudentDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolId)
        .collection("Classes")
        .doc(widget.classId)
        .collection("Students")
        .doc(studentID)
        .get();
    setState(() {
      studentName = vari.data()!['studentName'];
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

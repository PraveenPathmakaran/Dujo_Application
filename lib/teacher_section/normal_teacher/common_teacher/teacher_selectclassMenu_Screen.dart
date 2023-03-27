import 'package:dujo_application/teacher_section/attendence_section/attendence-Book/attendence_Book_status.dart';
import 'package:dujo_application/teacher_section/attendence_section/classTeacher_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../home/guardian_home/guardian_home_screen.dart';
import '../../../home/student_home/Students_sections/constants.dart';
import 'commonsubject.dart';
import 'dart:developer';

class TeacherMenuClassScreen extends StatelessWidget {
  var classID;
  var teacherId;
  var schoolID;

  TeacherMenuClassScreen(
      {required this.classID,
      required this.teacherId,
      required this.schoolID,
      super.key});

  @override
  Widget build(BuildContext context) {
    log("Schoolid>>>>>>>>>>>>?${schoolID}");

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenSize.width * 1 / 6,
                  bottom: screenSize.width * 1 / 18),
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
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubjectsCommon()),
                              );
                            },
                            icon: 'assets/icons/teacher.svg',
                            title: 'Subjects',
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
                              print("object");
                              Get.to(ClassTeacherIdentifyScreen(
                                  teacheremailID: teacherId,
                                  classID: classID,
                                  schoolID: schoolID));
                            },
                            icon: 'assets/icons/takeattendence.svg',
                            title: 'Take\nAttendence',
                          ),
                          HomeCard(
                            onPress: () {
                              Get.to(AttendenceBookScreen(classID:classID,schoolId: schoolID,)
                                  );
                            },
                            icon: 'assets/icons/attendencebook.svg',
                            title: 'Attendence Book',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {
                              // Get.to(AttendenceDetailsScreen(schoolId: schoolID,classID: classID,));
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  const ClassCard(
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
          color: knewColor,
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

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/teacher_section/normal_teacher/common_teacher/teacher_selectclassMenu_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../home/student_home/Students_sections/constants.dart';
import '../../../home/teacher_home/widgets/card_container.dart';
import '../../../model/getClassesList_model.dart';

class CommonTeacherHome extends StatefulWidget {
  var schoolId;
  var teacherEmail;

  CommonTeacherHome(
      {required this.schoolId, required this.teacherEmail, super.key});

  @override
  State<CommonTeacherHome> createState() => _CommonTeacherHomeState();
}

class _CommonTeacherHomeState extends State<CommonTeacherHome> {
  String teacherImage = '';
  String teacherName = "";
  String teacherClass = "";
  @override
  void initState() {
    getTeacherDetails();
    super.initState();
  }

  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    log("Fecting schooil id ..............${widget.schoolId}");
    int columnCount = 2;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100.w,
            height: 50.h,
            color: Color.fromARGB(255, 206, 85, 85),
            padding: EdgeInsets.all(kDefaultPadding),
            child: ListView(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ParentName(
                            parentName: 'Teacher',
                          ),
                          kHalfSizedBox,
                          kHalfSizedBox,
                          StudentClass(studentClass: teacherName),
                          kHalfSizedBox,
                        ],
                      ),
                      kHalfSizedBox,
                      StudentPicture(picAddress: teacherImage, onPress: () {}),
                    ],
                  ),
                ),
                sizedBox,
                Column(
                  children: [
                    StudentDataCard(
                      onPress: () {},
                      title: 'timetable',
                      value: teacherClass,
                    ),
                  ],
                ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                      onPress: () {},
                      title: 'Attendance \n Total',
                      value: '90.02%',
                    ),
                    StudentDataCard(
                      onPress: () {
                        // Navigator.pushNamed(context, FeeScreen.routeName);
                      },
                      title: 'Total Fees',
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
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("SchoolListCollection")
                      .doc(widget.schoolId)
                      .collection("Teachers")
                      .doc(widget.teacherEmail)
                      .collection("teacherClasses")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return AnimationLimiter(
                        child: GridView.count(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          padding: EdgeInsets.all(_w / 60),
                          crossAxisCount: columnCount,
                          children: List.generate(
                            snapshot.data!.docs.length,
                            (int index) {
                              final data = AddClassesModel.fromJson(
                                  snapshot.data!.docs[index].data());
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 200),
                                columnCount: columnCount,
                                child: ScaleAnimation(
                                  duration: const Duration(milliseconds: 900),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: FadeInAnimation(
                                    child: GestureDetector(
                                      onTap: () {
                                            log("Schoolid>>>>>>>>>>>>?${widget.schoolId}");

                                        Get.to(TeacherMenuClassScreen(
                                          schoolID: widget.schoolId,
                                          teacherId: widget.teacherEmail,
                                          classID: data.id,
                                          
                                        ));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: _w / 10,
                                            left: _w / 20,
                                            right: _w / 20),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(213, 161, 34, 34),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 40,
                                              spreadRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            data.className,
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getTeacherDetails() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolId)
        .collection("Teachers")
        .doc(widget.teacherEmail)
        .get();
    setState(() {
      teacherName = vari.data()!['teacherName'];
      teacherImage = vari.data()!['teacherImage'];
    });
    log(teacherImage.toString());
  }
}

class ClassCard extends StatelessWidget {
  const ClassCard({Key? key, required this.onPress, required this.title})
      : super(key: key);
  final VoidCallback onPress;
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
//CommonTeacherHomeMain
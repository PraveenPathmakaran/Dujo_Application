
import 'package:dujo_application/signing/siginig_section/guardian_login.dart';
import 'package:dujo_application/signing/siginig_section/parentLogin.dart';
import 'package:dujo_application/signing/siginig_section/student_login.dart';
import 'package:dujo_application/signing/siginig_section/teacher_login.dart';
import 'package:flutter/material.dart';

const List<Widget> schools = <Widget>[
  Text('Student'),
  Text('Parent'),
  Text('Guardian'),
  Text('Teacher')
];

class DujoLogin extends StatefulWidget {
  var schoolID;
  var classID;
  DujoLogin({this.schoolID, this.classID, super.key});

  @override
  State<DujoLogin> createState() => _DujoLoginState();
}

class _DujoLoginState extends State<DujoLogin> with TickerProviderStateMixin {
  final List<bool> _selectedSchools = <bool>[true, false, false, false];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: ListView(children: [
        Stack(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenSize.width * 1 / 3.5, left: 30),
                  child: Container(
                    height: screenSize.width * 1 / 7,
                    width: screenSize.width * 1 / 2,
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 35,
                          color: Color.fromARGB(255, 252, 10, 232)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenSize.width * 1 / 4.5, left: 30),
                  child: Container(
                    height: screenSize.width * 1 / 7,
                    width: screenSize.width * 1 / 2,
                    child: const Text(
                      "Welcome Back,",
                      style: TextStyle(
                          fontSize: 25, color: Color.fromARGB(255, 90, 1, 131)),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 1,
                ),
                Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(top: screenSize.width * 1 / 12),
                            width: screenSize.width / 3,
                            child: const Divider(
                              color: Colors.red,
                              thickness: 3,
                            )),
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.width * 1 / 12),
                          child: Container(
                            height: screenSize.width * 1 / 7,
                            width: screenSize.width * 1 / 3,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://storage.googleapis.com/scipro-bucket/lepton%20dujo.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(top: screenSize.width * 1 / 12),
                            width: screenSize.width / 3,
                            child: const Divider(
                              color: Colors.red,
                              thickness: 3,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: screenSize.width * 0.89),
                child: Container(
                  height: screenSize.width * 1.145,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(29),
                        topRight: Radius.circular(29)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 93, 8, 190),
                        Color.fromARGB(255, 187, 33, 214),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 230),
                        child: Text(
                          "Sign in As:",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 390,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            Card(
                              elevation: 5,
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TabBar(
                                    controller: tabController,
                                    isScrollable: true,
                                    labelPadding:
                                        const EdgeInsets.symmetric(horizontal: 30),
                                    indicator: BoxDecoration(
                                        color: const Color.fromARGB(255, 93, 8, 190)
                                            .withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    tabs:const [
                                      Text(
                                        "Student",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Parent",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Guardian",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Teacher",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ]),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  StudentLoginSection(
                                      screenSize: screenSize,
                                      schoolId: widget.schoolID,
                                      classID: widget.classID),
                                  ParentLoginSection(
                                    classID: widget.classID,
                                      screenSize: screenSize,
                                      schoolID: widget.schoolID),
                                      // GuardianLoginSection
                                  GuardianLoginSection(
                                    classID:widget.classID ,
                                    schooilID:widget.schoolID ,
                                      screenSize: screenSize, id: ''),
                                  TeacherLoginSection(
                                    classID: widget.classID,
                                    screenSize: screenSize,
                                    schoolId: widget.schoolID,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                )),
          ],
        ),
      ]),
    ));
  }
}

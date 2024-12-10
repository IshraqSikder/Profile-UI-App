import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showAllCourses = false;
  List<String> cCodes = [], cNames = [];
  void fetchCourseCodes() {
    cCodes = [
      "CSE-3521",
      "CSE-3523",
      "CSE-3524",
      "CSE-3527",
      "CSE-3528",
      "CSE-3529",
      "CSE-3532",
      "URED-3503",
      "ECON-3501"
    ];
  }

  void fetchCourseNames() {
    cNames = [
      "Computer Architecture",
      "Microprocessor",
      "Microprocessor Lab",
      "Compiler",
      "Compiler Lab",
      "System Analysis & Design",
      "Tools & Technologies",
      "Political Thoughts & Behaviour",
      "Principles of Economics"
    ];
  }

  List<Widget> generateCourseUI(var courseVar, var sz) {
    List<Widget> w = [];
    // check condition for show all courses
    int limit = showAllCourses ? courseVar.length : 3;
    for (var i = 0; i < limit; i++) {
      w.add(Text(
        courseVar[i],
        style: TextStyle(
          fontSize: sz.width * 0.045,
        ),
      ));
    }
    return w;
  }

  @override
  void initState() {
    super.initState();
    fetchCourseCodes();
    fetchCourseNames();
  }

  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Profile Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sz.width * 0.075,
                  ),
                ),
                SizedBox(
                  height: sz.height * 0.05,
                ),
                Container(
                  width: sz.width * 0.25,
                  height: sz.width * 0.25,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/handsome.png",
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: sz.height * 0.015,
                ),
                Text(
                  "Ishraq U. Sikder",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sz.width * 0.055,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(sz.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: sz.width * 0.35,
                        height: sz.height * 0.045,
                        decoration: BoxDecoration(
                            color: Colors.amber[700],
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "CGPA",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: sz.width * 0.045,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: sz.width * 0.35,
                        height: sz.height * 0.045,
                        decoration: BoxDecoration(
                            color: Colors.amber[700],
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Semester",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: sz.width * 0.045,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Mobile : +8801824829832",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sz.width * 0.045,
                  ),
                ),
                Text(
                  "Email : nirzon.sikderbd@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: sz.width * 0.045,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: sz.width * 0.065,
                    right: sz.width * 0.065,
                    top: sz.width * 0.065,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fireplace,
                        size: sz.width * 0.05,
                      ),
                      SizedBox(width: sz.width * 0.02),
                      Text(
                        "Current Courses:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: sz.width * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: sz.width * 0.85,
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showAllCourses = !showAllCourses;
                      });
                    },
                    child: Text(
                      showAllCourses ? "Show Less" : "Show All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: sz.width * 0.04,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 555,
                  ),
                  width: sz.width * 0.85,
                  height: showAllCourses ? sz.height * 0.35 : sz.height * 0.175,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Course Code",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: sz.width * 0.045,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: generateCourseUI(cCodes, sz),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: sz.width * 0.075,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Course Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: sz.width * 0.045,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: generateCourseUI(cNames, sz),
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
          ),
        ),
      ),
    );
  }
}

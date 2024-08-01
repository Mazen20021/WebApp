import 'package:MathMasters/Config/comHelper.dart';
import 'package:MathMasters/FireBase/UsersDataBase.dart';
import 'package:MathMasters/unusedpages/Mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MathMasters/Config/CustomButtons.dart';
import 'AdminLogin.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() {
    return _studentPage();
  }
}

class _studentPage extends State<StudentPage> {
  bool _isHovering = false;
  bool _isHovering1 = false;
  bool _isHovering2 = false;

  void _onEnter(bool hover, int num) {
    switch (num) {
      case 1:
        setState(() {
          _isHovering = hover;
        });
        break;
      case 2:
        setState(() {
          _isHovering1 = hover;
        });
      case 3:
        setState(() {
          _isHovering2 = hover;
        });
      default:
        break;
    }
  }

  void _mainpage(BuildContext context) {
    Navigator.pushNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: MouseRegion(
            onEnter: (event) => _onEnter(true, 1),
            onExit: (event) => _onEnter(false, 1),
            child: ElevatedButton.icon(
              onPressed: () => _mainpage(context),
              label: const Text(
                "HomePage",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              icon: const Icon(
                Icons.home,
                size: 37,
                color: Color.fromARGB(255, 183, 248, 6),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_isHovering
                      ? const Color.fromARGB(255, 151, 31, 23)
                      : const Color.fromARGB(255, 36, 50, 51))),
            )),
        elevation: 20,
        backgroundColor: const Color.fromARGB(255, 255, 249, 208),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.3, vertical: screenHeight * 0.2),
          color: const Color.fromARGB(255, 31, 47, 46),
          child: Center(
            child: Column(
              children: [
                MouseRegion(
                    onEnter: (event) => _onEnter(true, 2),
                    onExit: (event) => _onEnter(false, 2),
                    child: ElevatedButton(
                      onPressed: () => {}, //_loginMM(context),
                      child: Text(
                        "Math Masters",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 50),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              _isHovering1
                                  ? const Color.fromARGB(255, 144, 214, 12)
                                  : const Color.fromARGB(255, 233, 225, 201))),
                    )),
                SizedBox(height: 100),
                MouseRegion(
                    onEnter: (event) => _onEnter(true, 3),
                    onExit: (event) => _onEnter(false, 3),
                    child: ElevatedButton(
                      onPressed: () => {}, //_loginST(context),
                      child: Text(
                        "Student",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 50),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              _isHovering2
                                  ? const Color.fromARGB(255, 144, 214, 12)
                                  : const Color.fromARGB(255, 233, 225, 201))),
                    )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

import 'package:MathMasters/Config/comHelper.dart';
import 'package:MathMasters/FireBase/UsersDataBase.dart';
import 'package:MathMasters/Pages/AuthoCheck.dart';
import 'package:MathMasters/unusedpages/Mainmenu.dart';
import 'package:MathMasters/Pages/ViewAssistants.dart';
import 'package:MathMasters/Pages/ViewNewStudents.dart';
import 'package:MathMasters/Pages/ViewStudents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MathMasters/Config/CustomButtons.dart';
import 'package:flutter/rendering.dart';
import 'AdminLogin.dart';

class Assistant extends StatefulWidget {
  const Assistant({super.key});

  @override
  State<Assistant> createState() {
    return _Assistant();
  }
}

class _Assistant extends State<Assistant> {
  bool _isHovering = false;
  bool _isHovering3 = false;
  bool _isHovering4 = false;
  bool _isHovering5 = false;
  bool _hasnoti = false;

  Future<bool> showLogoutConfirmationDialog(BuildContext context) async {
    print('showLogoutConfirmationDialog called'); // Debug statement
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Are you sure you want to logout?',
                style: TextStyle(fontSize: 20),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('No', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.redAccent, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  void _logout(BuildContext context) async {
    bool shouldLogout = await showLogoutConfirmationDialog(context);
    if (shouldLogout) {
      await FirebaseAuth.instance.signOut();
      // Ensure Firebase is initialized before calling this if needed
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => AuthCheck(Role: "")), // Restart the app
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  void initState() {
    _checkForNewStudents();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onEnter(bool hover, int num) {
    switch (num) {
      case 1:
        setState(() {
          _isHovering = hover;
        });
        break;
      case 2:
        setState(() {
          _isHovering3 = hover;
        });
        break;
      case 3:
        setState(() {
          _isHovering4 = hover;
        });
        break;
      case 4:
        setState(() {
          _isHovering5 = hover;
        });
        break;
      default:
        break;
    }
  }

  bool newStudents = false;
  void _students(BuildContext context) {}
  void _Assistants(BuildContext context) {}
  void _Tasks(BuildContext context) {}
  void _Assigments(BuildContext context) {}
  void _Videos(BuildContext context) {}
  void _Books(BuildContext context) {}

  void _checkForNewStudents() async {
    // Reference to the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      // Access the Submission collection and filter by Status = "New"
      QuerySnapshot querySnapshot = await firestore
          .collection('Submission')
          .where('Type', isEqualTo: 'New')
          .get();

      // Process the querySnapshot
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          setState(() {
            newStudents = true;
          });
        }
      } else {
        setState(() {
          newStudents = false;
        });
      }
    } catch (e) {
      print('Error checking for new students: $e');
    }
  }

  final Map<String, bool> _isHovering1 = {
    "Current Students": false,
    "New Students": false,
    "My Tasks": false,
    "Assignments": false,
  };

  @override
  Widget build(BuildContext context) {
    _checkForNewStudents();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
        onWillPop: () async {
          return await showLogoutConfirmationDialog(context);
        },
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  MouseRegion(
                    onEnter: (event) => _onEnter(true, 1),
                    onExit: (event) => _onEnter(false, 1),
                    child: IconButton(
                      onPressed: () => _logout(context),
                      // label: const Text(
                      //   "Log Out",
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      icon: Icon(
                        Icons.logout_rounded,
                        size: 37,
                        color: _isHovering
                            ? Color.fromARGB(255, 151, 31, 23)
                            : Color.fromARGB(255, 41, 75, 189),

                        // style: ButtonStyle(
                        //   backgroundColor: MaterialStateProperty.all(
                        //     _isHovering
                        //         ? Color.fromARGB(255, 151, 31, 23)
                        //         : Color.fromARGB(255, 36, 50, 51),
                        //   ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // MouseRegion(
                  //   onEnter: (event) => _onEnter(true, 3),
                  //   onExit: (event) => _onEnter(false, 3),
                  //   child: IconButton(
                  //       onPressed: () => {}, //_toggleChat,
                  //       icon: Icon(
                  //         Icons.chat,
                  //         color: _isHovering4
                  //             ? Color.fromARGB(255, 151, 31, 23)
                  //             : Color.fromARGB(255, 41, 75, 189),
                  //         size: 37,
                  //       )),
                  // ),
                  if (screenWidth < 800)
                    SizedBox(
                      width: screenWidth * 0.9,
                    )
                  else
                    SizedBox(
                      width: screenWidth * 0.8,
                    ),
                  const Spacer(),
                  MouseRegion(
                    onEnter: (event) => _onEnter(true, 4),
                    onExit: (event) => _onEnter(false, 4),
                    child: IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((_) => ViewNewStudents()))),
                        icon: newStudents
                            ? Icon(
                                Icons.notification_important_rounded,
                                size: 37,
                                color: Color.fromARGB(255, 151, 31, 23),
                              )
                            : Icon(
                                Icons.notifications,
                                color: _isHovering5
                                    ? Color.fromARGB(255, 151, 31, 23)
                                    : Color.fromARGB(255, 41, 75, 189),
                                size: 37,
                              )),
                  ),
                  const Spacer(),
                  MouseRegion(
                    onEnter: (event) => _onEnter(true, 2),
                    onExit: (event) => _onEnter(false, 2),
                    child: IconButton(
                      onPressed: () => {},
                      // label: const Text(
                      //   "My Profile",
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      icon: Icon(
                        Icons.account_circle,
                        size: 37,
                        color: _isHovering3
                            ? Color.fromARGB(255, 151, 31, 23)
                            : Color.fromARGB(255, 41, 75, 189),

                        // style: ButtonStyle(
                        //   backgroundColor: MaterialStateProperty.all(
                        //     _isHovering3
                        //         ? Color.fromARGB(255, 151, 31, 23)
                        //         : Color.fromARGB(255, 36, 50, 51),
                        //   ),
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 20,
              backgroundColor: Color.fromARGB(255, 255, 249, 208),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = constraints.maxWidth;
                final screenHeight = constraints.maxHeight;
                return Stack(
                  children: [
                    // Background Image
                    Container(
                      width: screenWidth,
                      height: screenHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/BackGround.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Content
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            //if (_showChat) _openchat(),
                            SizedBox(height: 150),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: screenWidth < 600 ? 2 : 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 50,
                              childAspectRatio: 2.5,
                              children: [
                                buildCard("Current Students",
                                    Icons.supervisor_account_rounded),
                                buildCard("New Students",
                                    Icons.add_to_photos_rounded),
                                buildCard("My Tasks", Icons.task_alt_rounded),
                                buildCard("Assignments", Icons.assignment_add),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }

  void handleCardTap(String cardName) {
    switch (cardName) {
      case "Current Students":
        Navigator.push(
            context, MaterialPageRoute(builder: ((_) => ViewStudents())));
        break;
      case "New Students":
        Navigator.push(
            context, MaterialPageRoute(builder: ((_) => ViewAssistant())));
        break;
      case "My Tasks":
        break;
      case "Assigments":
        break;
    }
    ;
  }

  Widget buildCard(String title, IconData icon) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering1[title] = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering1[title] = false;
        });
      },
      child: InkWell(
        onTap: () => handleCardTap(title),
        child: Card(
          color: _isHovering1[title]!
              ? Color.fromARGB(255, 218, 36, 23).withOpacity(0.8)
              : Color.fromARGB(255, 195, 151, 112).withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: _isHovering1[title]!
                    ? Color.fromARGB(255, 183, 248, 6)
                    : Colors.black,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: _isHovering1[title]!
                      ? Color.fromARGB(255, 183, 248, 6)
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

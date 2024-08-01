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

class Teacherpage extends StatefulWidget {
  const Teacherpage({super.key});

  @override
  State<Teacherpage> createState() {
    return _Teacherpage();
  }
}

class _Teacherpage extends State<Teacherpage> {
  bool _isHovering = false;
  bool _isHovering3 = false;
  bool _isHovering4 = false;
  bool _isHovering5 = false;
  bool _hasnoti = false;
  void _loginMM(BuildContext context) async {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: ((_) => const LoginAdmin())));
    });
  }

  Future<bool> showLogoutConfirmationDialog(BuildContext context) async {
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
    "Students": false,
    "Assistants": false,
    "Tasks": false,
    "Assignments": false,
    "Videos": false,
    "Books": false,
  };
  // bool _showChat = false;
  // TextEditingController messagesCont = TextEditingController();

  // List<Map<String, String>> messages = [
  //   {"sender": "bot", "text": "Hello, I am ChatBot v1.0"},
  //   {"sender": "bot", "text": "How can I help you?"}
  // ];

  // void _toggleChat() {
  //   setState(() {
  //     _showChat = !_showChat;
  //   });
  // }

  // void sendMessage(String message) {
  //   if (message.isNotEmpty) {
  //     setState(() {
  //       messages.add({"sender": "user", "text": message});
  //       messagesCont.clear();
  //     });
  //     // Simulate a bot response after a short delay
  //     Future.delayed(Duration(seconds: 1), () {
  //       setState(() {
  //         botmessage(message);
  //       });
  //     });
  //   }
  // }

  // Widget _openchat() {
  //   return Align(
  //     child: Container(
  //       width: 300,
  //       height: 400, // Add margin directly here
  //       child: Card(
  //         color: Colors.white,
  //         elevation: 20,
  //         child: Column(
  //           children: [
  //             Container(
  //               color: Color.fromARGB(255, 17, 153, 119),
  //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text("Chat", style: TextStyle(color: Colors.white)),
  //                   IconButton(
  //                     onPressed: _toggleChat,
  //                     icon: Icon(Icons.close, color: Colors.white),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Expanded(
  //               child: ListView.builder(
  //                 itemCount: messages.length,
  //                 itemBuilder: (context, index) {
  //                   bool isBot = messages[index]["sender"] == "bot";
  //                   return ListTile(
  //                     title: Align(
  //                       alignment: isBot
  //                           ? Alignment.centerLeft
  //                           : Alignment.centerRight,
  //                       child: Container(
  //                         padding: EdgeInsets.all(8.0),
  //                         decoration: BoxDecoration(
  //                           color: isBot
  //                               ? Color.fromARGB(255, 250, 185, 185)
  //                               : Color.fromARGB(255, 151, 255, 215),
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                         child: Text(messages[index]["text"] ?? ""),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                     child: TextField(
  //                       controller: messagesCont,
  //                       decoration: InputDecoration(
  //                         hintText: "Enter your message",
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(width: 10),
  //                   IconButton(
  //                     onPressed: () {
  //                       sendMessage(messagesCont.text);
  //                     },
  //                     icon: Icon(Icons.send),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // void save_message(String message) {}
  // void botmessage(String message) {
  //   if (message.contains("help") || message.contains("Help")) {
  //     messages.add({"sender": "bot", "text": "Hi, Here is what I can do:"});
  //     messages.add({"sender": "bot", "text": "1- Site Problem (Site) or (1)"});
  //     messages.add(
  //         {"sender": "bot", "text": "2- Homework Problem (Homework) or (2)"});
  //     messages.add(
  //         {"sender": "bot", "text": "3- Information About Site (Info) or (3)"});
  //   } else if (message.contains("hi") || message.contains("Hi")) {
  //     messages.add({"sender": "bot", "text": "Hi, Here is what I can do:"});
  //     messages.add({"sender": "bot", "text": "1- Site Problem (Site) or (1)"});
  //     messages.add(
  //         {"sender": "bot", "text": "2- Homework Problem (Homework) or (2)"});
  //     messages.add(
  //         {"sender": "bot", "text": "3- Information About Site (Info) or (3)"});
  //   } else if (message.contains("1") ||
  //       message.contains("Site") ||
  //       message.contains("site")) {
  //     messages.add({
  //       "sender": "bot",
  //       "text":
  //           "You can tell me you problem and Eng.Mazen Will Reach You As soon as possible"
  //     });
  //   } else if (message.contains("2") ||
  //       message.contains("Homework") ||
  //       message.contains("home") ||
  //       message.contains("homework")) {
  //     messages.add({"sender": "bot", "text": "You selected Homework Problem."});
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: ((_) => const Login())));
  //   } else if (message.contains("3") ||
  //       message.contains("info") ||
  //       message.contains("information")) {
  //     messages.add(
  //         {"sender": "bot", "text": "You selected Information About Site."});
  //   } else {
  //     messages.add({"sender": "bot", "text": "I could not get that."});
  //   }
  // }

  // Widget _buildMessageItem(
  //     BuildContext context, int index, Animation<double> animation) {
  //   bool isBot = messages[index]["sender"] == "bot";
  //   return SizeTransition(
  //     sizeFactor: animation,
  //     child: ListTile(
  //       title: Align(
  //         alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
  //         child: Container(
  //           padding: EdgeInsets.all(8.0),
  //           decoration: BoxDecoration(
  //             color: isBot
  //                 ? const Color.fromARGB(255, 238, 155, 155)
  //                 : Color.fromARGB(255, 129, 219, 151),
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: Text(messages[index]["text"] ?? ""),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
                                buildCard("Students",
                                    Icons.supervisor_account_rounded),
                                buildCard("Assistants", Icons.person_2_rounded),
                                buildCard("Tasks", Icons.task_alt_rounded),
                                buildCard("Assignments", Icons.assignment_add),
                                buildCard(
                                    "Videos", Icons.video_collection_rounded),
                                buildCard("Books", Icons.menu_book_rounded),
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
      case "Students":
        Navigator.push(
            context, MaterialPageRoute(builder: ((_) => ViewStudents())));
        break;
      case "Assistants":
        Navigator.push(
            context, MaterialPageRoute(builder: ((_) => ViewAssistant())));
        break;
      case "Tasks":
        break;
      case "Assigments":
        break;
      case "Videos":
        break;
      case "Books":
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

import 'dart:async';
import 'package:MathMasters/Pages/About.dart';
import 'package:MathMasters/Pages/AdminLogin.dart';
import 'package:MathMasters/Pages/AuthoCheck.dart';
import 'package:MathMasters/Pages/Honor.dart';
import 'package:MathMasters/Pages/news.dart';
import 'package:MathMasters/Pages/reg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class MainpageALG extends StatefulWidget {
  @override
  mainpagealg createState() => mainpagealg();
}

class mainpagealg extends State<MainpageALG> {
  double _leftPosition = 0;
  bool _movingRight = true;
  bool _isHovering = false;
  bool _isHovering1 = false;
  bool _isHovering2 = false;
  bool _isHovering3 = false;
  bool _isHovering4 = false;
  bool _isHovering5 = false;
  bool _isHovering6 = false;
  bool _isHovering7 = false;
  bool _isHovering8 = false;
  bool _isHovering9 = false;
  bool _isHovering10 = false;
  bool _isHovering11 = false;
  bool _isHovering12 = false;
  bool _isHovering13 = false;
  bool _isHovering14 = false;
  bool _isHovering15 = false;
  bool _isHovering16 = false;
  bool _isHovering20 = false;

  void launchGoogleMaps() async {
    const url =
        'https://www.google.com/maps/search/?api=1&query=30.065057,31.272531';
    html.window.open(url, 'new_tab'); // Use dart:html to open URL in new tab
  }

  void facebook() async {
    const url = 'https://www.facebook.com/share/MvaBA3RsSSJtWA6z/';
    html.window.open(url, 'new_tab');
  }

  void youtube() async {
    const url = '';
    html.window.open(url, 'new_tab');
  }

  @override
  void initState() {
    super.initState();
    // _toggleChat();
    // Timer.periodic(Duration(milliseconds: 5), (timer) {
    //   setState(() {
    //     if (_movingRight) {
    //       _leftPosition += 2;
    //       if (_leftPosition >= MediaQuery.of(context).size.width) {
    //         _movingRight = false;
    //       }
    //     } else {
    //       _leftPosition -= 2;
    //       if (_leftPosition <= 0) {
    //         _movingRight = true;
    //       }
    //     }
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _showpure = false;
  bool _showAppliedMath = false;
  void _onEnter(bool hover, int num) {
    setState(() {
      switch (num) {
        case 1:
          _isHovering = hover;
          break;
        case 2:
          _isHovering1 = hover;
          break;
        case 3:
          _isHovering2 = hover;
          break;
        case 4:
          _isHovering3 = hover;
          break;
        case 5:
          _isHovering4 = hover;
          break;
        case 6:
          _isHovering5 = hover;
          break;
        case 7:
          _isHovering6 = hover;
          break;
        case 8:
          _isHovering7 = hover;
          break;
        case 9:
          _isHovering8 = hover;
          break;
        case 10:
          _isHovering9 = hover;
          break;
        case 11:
          _isHovering10 = hover;
          break;
        case 12:
          _isHovering11 = hover;
          break;
        case 13:
          _isHovering12 = hover;
          break;
        case 14:
          _isHovering20 = hover;
          break;
        case 15:
          _isHovering13 = hover;
          break;
        case 16:
          _isHovering14 = hover;
          break;
        case 21:
          _isHovering16 = hover;
          break;
        case 20:
          _isHovering15 = hover;
          break;
        default:
          break;
      }
    });
  }

  bool _showChat = false;
  TextEditingController messagesCont = TextEditingController();

  List<Map<String, String>> messages = [
    {"sender": "bot", "text": "Hello, I am ChatBot v1.0"},
    {"sender": "bot", "text": "How can I help you?"}
  ];

  void _toggleChat() {
    setState(() {
      _showChat = !_showChat;
    });
  }

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        messages.add({"sender": "user", "text": message});
        messagesCont.clear();
      });
      // Simulate a bot response after a short delay
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          botmessage(message);
        });
      });
    }
  }

  Widget _openchat() {
    return Align(
      child: Container(
        width: 300,
        height: 400, // Add margin directly here
        child: Card(
          color: Colors.white,
          elevation: 20,
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 17, 153, 119),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Chat", style: TextStyle(color: Colors.white)),
                    IconButton(
                      onPressed: _toggleChat,
                      icon: Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    bool isBot = messages[index]["sender"] == "bot";
                    return ListTile(
                      title: Align(
                        alignment: isBot
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: isBot
                                ? Color.fromARGB(255, 250, 185, 185)
                                : Color.fromARGB(255, 151, 255, 215),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(messages[index]["text"] ?? ""),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messagesCont,
                        decoration: InputDecoration(
                          hintText: "Enter your message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        sendMessage(messagesCont.text);
                      },
                      icon: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void botmessage(String message) {
    if (message.contains("help") || message.contains("Help")) {
      messages.add({"sender": "bot", "text": "Hi, Here is what I can do:"});
      messages.add({"sender": "bot", "text": "1- Site Problem (Site) or (1)"});
      messages.add(
          {"sender": "bot", "text": "2- Homework Problem (Homework) or (2)"});
      messages.add(
          {"sender": "bot", "text": "3- Information About Site (Info) or (3)"});
    } else if (message.contains("hi") || message.contains("Hi")) {
      messages.add({"sender": "bot", "text": "Hi, Here is what I can do:"});
      messages.add({"sender": "bot", "text": "1- Site Problem (Site) or (1)"});
      messages.add(
          {"sender": "bot", "text": "2- Homework Problem (Homework) or (2)"});
      messages.add(
          {"sender": "bot", "text": "3- Information About Site (Info) or (3)"});
    } else if (message.contains("1") ||
        message.contains("Site") ||
        message.contains("site")) {
      messages.add({
        "sender": "bot",
        "text":
            "You can tell me you problem and Eng.Mazen Will Reach You As soon as possible"
      });
    } else if (message.contains("2") ||
        message.contains("Homework") ||
        message.contains("home") ||
        message.contains("homework")) {
      messages.add({"sender": "bot", "text": "You selected Homework Problem."});
    } else if (message.contains("3") ||
        message.contains("info") ||
        message.contains("information")) {
      messages.add(
          {"sender": "bot", "text": "You selected Information About Site."});
    } else {
      messages.add({"sender": "bot", "text": "I could not get that."});
    }
  }

  Widget _buildMessageItem(
      BuildContext context, int index, Animation<double> animation) {
    bool isBot = messages[index]["sender"] == "bot";
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Align(
          alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isBot
                  ? const Color.fromARGB(255, 238, 155, 155)
                  : Color.fromARGB(255, 129, 219, 151),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(messages[index]["text"] ?? ""),
          ),
        ),
      ),
    );
  }

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
      await Firebase.initializeApp();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => AuthCheck(Role: '')), // Restart the app
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              MouseRegion(
                onEnter: (event) => _onEnter(true, 6),
                onExit: (event) => _onEnter(false, 6),
                child: IconButton(
                  onPressed: () => _logout(context),
                  icon: Icon(Icons.logout_rounded,
                      size: 37,
                      color: _isHovering5
                          ? const Color.fromARGB(255, 151, 31, 23)
                          : const Color.fromARGB(255, 36, 50, 51)),
                ),
              ),
              const Spacer(),
              MouseRegion(
                onEnter: (event) => _onEnter(true, 2),
                onExit: (event) => _onEnter(false, 2),
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: ((_) => const Honors()))),
                  label: const Text("Honor Board",
                      style: TextStyle(color: Colors.white)),
                  icon: const Icon(Icons.bookmark_outlined,
                      size: 37, color: Color.fromARGB(255, 0, 164, 240)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      _isHovering1
                          ? const Color.fromARGB(255, 151, 31, 23)
                          : const Color.fromARGB(255, 36, 50, 51),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              MouseRegion(
                onEnter: (event) => _onEnter(true, 13),
                onExit: (event) => _onEnter(false, 13),
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((_) => UnderDevelopmentPage()))),
                  label:
                      const Text("News", style: TextStyle(color: Colors.white)),
                  icon: const Icon(Icons.newspaper_outlined,
                      size: 37, color: Color.fromARGB(255, 150, 203, 228)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      _isHovering12
                          ? const Color.fromARGB(255, 151, 31, 23)
                          : const Color.fromARGB(255, 36, 50, 51),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              MouseRegion(
                onEnter: (event) => _onEnter(true, 3),
                onExit: (event) => _onEnter(false, 3),
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((_) => UnderDevelopmentPage()))),
                  label: const Text("TimeTable",
                      style: TextStyle(color: Colors.white)),
                  icon: const Icon(Icons.table_chart_rounded,
                      size: 37, color: Color.fromARGB(255, 19, 216, 78)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      _isHovering2
                          ? const Color.fromARGB(255, 151, 31, 23)
                          : const Color.fromARGB(255, 36, 50, 51),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              MouseRegion(
                onEnter: (event) => _onEnter(true, 4),
                onExit: (event) => _onEnter(false, 4),
                child: ElevatedButton.icon(
                  onPressed: launchGoogleMaps,
                  label: const Text("Sessions Location",
                      style: TextStyle(color: Colors.white)),
                  icon: const Icon(Icons.location_city_rounded,
                      size: 37, color: Color.fromARGB(255, 119, 146, 235)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      _isHovering3
                          ? const Color.fromARGB(255, 151, 31, 23)
                          : const Color.fromARGB(255, 36, 50, 51),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              MouseRegion(
                onEnter: (event) => _onEnter(true, 5),
                onExit: (event) => _onEnter(false, 5),
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: ((_) => const Aboutus()))),
                  label: const Text("About Us",
                      style: TextStyle(color: Colors.white)),
                  icon: const Icon(Icons.groups_rounded,
                      size: 37, color: Color.fromARGB(255, 60, 118, 170)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      _isHovering4
                          ? const Color.fromARGB(255, 151, 31, 23)
                          : const Color.fromARGB(255, 36, 50, 51),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // MouseRegion(
              //   onEnter: (event) => _onEnter(true, 6),
              //   onExit: (event) => _onEnter(false, 6),
              //   child: ElevatedButton.icon(
              //     onPressed: () => Navigator.push(context,
              //         MaterialPageRoute(builder: ((_) => LoginAdmin()))),
              //     label: const Text("Login",
              //         style: TextStyle(color: Colors.white)),
              //     icon: const Icon(Icons.supervised_user_circle_rounded,
              //         size: 40, color: Color.fromARGB(255, 136, 64, 231)),
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all(
              //         _isHovering5
              //             ? const Color.fromARGB(255, 151, 31, 23)
              //             : const Color.fromARGB(255, 36, 50, 51),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          elevation: 20,
          backgroundColor: const Color.fromARGB(255, 255, 249, 208),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 21, 32, 26),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.001,
                      vertical: screenHeight * 0.001,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/blob.jpeg',
                              fit: BoxFit.cover,
                              height: 280, // Adjusted height
                              width: 220, // Adjusted width
                              scale: 0.001),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "MR. Othman Mostafa",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 214, 214, 247),
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "G. Math Teacher",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Our Programs",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: MouseRegion(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () => setState(() {
                                        _showpure = !_showpure;
                                      }),
                                      child: MouseRegion(
                                        onEnter: (event) => _onEnter(true, 7),
                                        onExit: (event) => _onEnter(false, 7),
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: _isHovering6
                                                ? Colors.lightBlue[50]
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(Icons.calculate,
                                                  size: 40,
                                                  color: Colors
                                                      .blue), // Added calculator icon
                                              const SizedBox(height: 8),
                                              const Text(
                                                "Pure Mathematics",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text(
                                                "Explore a wide range of math courses designed to help you master mathematical concepts and problem-solving techniques.",
                                              ),
                                              if (_showpure) Pure(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                                child: MouseRegion(
                              child: Column(children: [
                                InkWell(
                                  onTap: () => {print("Statistics")},
                                  child: MouseRegion(
                                      onEnter: (event) => _onEnter(true, 8),
                                      onExit: (event) => _onEnter(false, 8),
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: _isHovering7
                                              ? Colors.lightBlue[50]
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.auto_graph,
                                                size: 40, color: Colors.green),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "Statistics",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "Learn how to analyze and interpret data, and make data-driven decisions with our comprehensive statistics courses.",
                                            ),
                                          ],
                                        ),
                                      )),
                                )
                              ]),
                            ))
                            //         InkWell(
                            //           onTap: () => {print("calc")},
                            //           child: MouseRegion(
                            //             onEnter: (event) => _onEnter(true, 9),
                            //             onExit: (event) => _onEnter(false, 9),
                            //             child: Container(
                            //               padding: const EdgeInsets.all(16),
                            //               decoration: BoxDecoration(
                            //                 color: _isHovering8
                            //                     ? Colors.lightBlue[50]
                            //                     : Colors.white,
                            //                 borderRadius:
                            //                     BorderRadius.circular(8),
                            //                 boxShadow: [
                            //                   BoxShadow(
                            //                     color: Colors.grey
                            //                         .withOpacity(0.3),
                            //                     spreadRadius: 2,
                            //                     blurRadius: 5,
                            //                   ),
                            //                 ],
                            //               ),
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   const Icon(
                            //                       Icons.area_chart_rounded,
                            //                       size: 40,
                            //                       color: Color.fromARGB(
                            //                           255,
                            //                           204,
                            //                           159,
                            //                           12)), // Added calculator icon
                            //                   const SizedBox(height: 8),
                            //                   const Text(
                            //                     "Calculus",
                            //                     style: TextStyle(
                            //                       fontSize: 20,
                            //                       fontWeight: FontWeight.bold,
                            //                     ),
                            //                   ),
                            //                   const SizedBox(height: 8),
                            //                   const Text(
                            //                     "Understand the principles of change and motion, techniques for solving complex problems, differentiation and integration.",
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //         const SizedBox(height: 16),
                            //         InkWell(
                            //           onTap: () => {print("trig")},
                            //           child: MouseRegion(
                            //               onEnter: (event) =>
                            //                   _onEnter(true, 10),
                            //               onExit: (event) =>
                            //                   _onEnter(false, 10),
                            //               child: Container(
                            //                 padding: const EdgeInsets.all(16),
                            //                 decoration: BoxDecoration(
                            //                   color: _isHovering9
                            //                       ? Colors.lightBlue[50]
                            //                       : Colors.white,
                            //                   borderRadius:
                            //                       BorderRadius.circular(8),
                            //                   boxShadow: [
                            //                     BoxShadow(
                            //                       color: Colors.grey
                            //                           .withOpacity(0.3),
                            //                       spreadRadius: 2,
                            //                       blurRadius: 5,
                            //                     ),
                            //                   ],
                            //                 ),
                            //                 child: Column(
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.start,
                            //                   children: [
                            //                     const Icon(
                            //                         Icons.shape_line_rounded,
                            //                         size: 40,
                            //                         color: Color.fromARGB(
                            //                             255, 9, 85, 129)),
                            //                     const SizedBox(height: 8),
                            //                     const Text(
                            //                       "Trigonometry",
                            //                       style: TextStyle(
                            //                         fontSize: 20,
                            //                         fontWeight: FontWeight.bold,
                            //                       ),
                            //                     ),
                            //                     const SizedBox(height: 8),
                            //                     const Text(
                            //                       "Explore the trigonometry to gain an understanding of the relationships between angles and sides in triangles, Knowing trigonometry techniques",
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )),
                            //         ),
                            //         const SizedBox(height: 16),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            ,
                            const SizedBox(width: 16),
                            Expanded(
                                child: MouseRegion(
                                    child: Column(children: [
                              InkWell(
                                onTap: () => setState(() {
                                  _showAppliedMath = !_showAppliedMath;
                                }),
                                child: MouseRegion(
                                    onEnter: (event) => _onEnter(true, 9),
                                    onExit: (event) => _onEnter(false, 9),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: _isHovering8
                                            ? Colors.lightBlue[50]
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.car_repair,
                                              size: 40,
                                              color: Color.fromARGB(
                                                  255, 185, 34, 7)),
                                          const SizedBox(height: 8),
                                          const Text(
                                            "Applied Mathematics",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            "Understand how forces interact in systems at rest. analyzing and solving problems related to equilibrium, structures and more",
                                          ),
                                          if (_showAppliedMath) applied(),
                                        ],
                                      ),
                                    )),
                              ),
                            ]))
                                //         InkWell(
                                //           onTap: () => {print("statics")},
                                //           child: MouseRegion(
                                //             onEnter: (event) => _onEnter(true, 11),
                                //             onExit: (event) => _onEnter(false, 11),
                                //             child: Container(
                                //               padding: const EdgeInsets.all(16),
                                //               decoration: BoxDecoration(
                                //                 color: _isHovering10
                                //                     ? Colors.lightBlue[50]
                                //                     : Colors.white,
                                //                 borderRadius:
                                //                     BorderRadius.circular(8),
                                //                 boxShadow: [
                                //                   BoxShadow(
                                //                     color: Colors.grey
                                //                         .withOpacity(0.3),
                                //                     spreadRadius: 2,
                                //                     blurRadius: 5,
                                //                   ),
                                //                 ],
                                //               ),
                                //               child: Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.start,
                                //                 children: [
                                //                   const Icon(
                                //                       Icons.car_repair_rounded,
                                //                       size: 40,
                                //                       color: Color.fromARGB(
                                //                           255,
                                //                           58,
                                //                           196,
                                //                           115)), // Added calculator icon
                                //                   const SizedBox(height: 8),
                                //                   const Text(
                                //                     "Applied Mathematics",
                                //                     style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold,
                                //                     ),
                                //                   ),
                                //                   const SizedBox(height: 8),
                                //                   const Text(
                                //                     "Understand how forces interact in systems at rest. analyzing and solving problems related to equilibrium, structures and more",
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //         const SizedBox(height: 16),
                                //         // InkWell(
                                //         //   onTap: () => {print("dynamics")},
                                //         //   child: MouseRegion(
                                //         //       onEnter: (event) =>
                                //         //           _onEnter(true, 12),
                                //         //       onExit: (event) =>
                                //         //           _onEnter(false, 12),
                                //         //       child: Container(
                                //         //         padding: const EdgeInsets.all(16),
                                //         //         decoration: BoxDecoration(
                                //         //           color: _isHovering11
                                //         //               ? Colors.lightBlue[50]
                                //         //               : Colors.white,
                                //         //           borderRadius:
                                //         //               BorderRadius.circular(8),
                                //         //           boxShadow: [
                                //         //             BoxShadow(
                                //         //               color: Colors.grey
                                //         //                   .withOpacity(0.3),
                                //         //               spreadRadius: 2,
                                //         //               blurRadius: 5,
                                //         //             ),
                                //         //           ],
                                //         //         ),
                                //         //         child: Column(
                                //         //           crossAxisAlignment:
                                //         //               CrossAxisAlignment.start,
                                //         //           children: [
                                //         //             const Icon(Icons.moving_rounded,
                                //         //                 size: 40,
                                //         //                 color: Color.fromARGB(
                                //         //                     255, 199, 60, 18)),
                                //         //             const SizedBox(height: 8),
                                //         //             const Text(
                                //         //               "Dynamics",
                                //         //               style: TextStyle(
                                //         //                 fontSize: 20,
                                //         //                 fontWeight: FontWeight.bold,
                                //         //               ),
                                //         //             ),
                                //         //             const SizedBox(height: 8),
                                //         //             const Text(
                                //         //               "Learn how to analyze and interpret data, and make data-driven decisions with our comprehensive statistics courses.",
                                //         //             ),
                                //         //           ],
                                //         //         ),
                                //         //       )),
                                //         // ),
                                //         const SizedBox(height: 16),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                )
                          ],
                        ),
                        //if (_showChat) _openchat(),
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.01,
                        vertical: screenHeight * 0.01,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: screenWidth * 0.45),
                          IconButton(
                              onPressed: () => facebook(),
                              icon: Icon(
                                Icons.facebook_rounded,
                                color: Color.fromARGB(255, 51, 64, 177),
                                size: 50,
                              )),
                          IconButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((_) =>
                                          UnderDevelopmentPage()))), //_toggleChat,
                              icon: Icon(
                                Icons.video_camera_front_rounded,
                                color: Color.fromARGB(255, 172, 26, 106),
                                size: 50,
                              )),
                          // IconButton(
                          //     onPressed: () => {}, //_toggleChat,
                          //     icon: Icon(
                          //       Icons.chat,
                          //       color: const Color.fromARGB(255, 49, 117, 84),
                          //       size: 50,
                          //     )),
                        ],
                      ))
                ],
              ),
            ),
            // Positioned(
            //   left: _leftPosition,
            //   bottom: screenHeight * 0.06,
            //   child: Text(
            //     'Welcome to our platform!',
            //     style: TextStyle(
            //       fontSize: 24,
            //       color: const Color.fromARGB(255, 58, 58, 58),
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget applied() {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            InkWell(
              onTap: () => {print("statics")},
              child: MouseRegion(
                onEnter: (event) => _onEnter(true, 11),
                onExit: (event) => _onEnter(false, 11),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _isHovering10
                        ? Colors.lightBlue[50]
                        : Color.fromARGB(255, 245, 160, 104),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.balance_rounded,
                          size: 40,
                          color: Color.fromARGB(
                              255, 1, 156, 177)), // Added calculator icon
                      const SizedBox(height: 8),
                      const Text(
                        "Statics",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Understand how forces interact in systems at rest. analyzing and solving problems related to equilibrium, structures and more",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => {print("dynamics")},
              child: MouseRegion(
                  onEnter: (event) => _onEnter(true, 12),
                  onExit: (event) => _onEnter(false, 12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isHovering11
                          ? Colors.lightBlue[50]
                          : Color.fromARGB(255, 90, 194, 235),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.motorcycle_outlined,
                            size: 40, color: Color.fromARGB(255, 199, 60, 18)),
                        const SizedBox(height: 8),
                        const Text(
                          "Dynamics",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Learn how to analyze and interpret data, and make data-driven decisions with our comprehensive statistics courses.",
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ))
      ],
    );
  }

  Widget Pure() {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            InkWell(
              onTap: () => {print("Alg")},
              child: MouseRegion(
                  onEnter: (event) => _onEnter(true, 20),
                  onExit: (event) => _onEnter(false, 20),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isHovering15
                          ? Colors.lightBlue[50]
                          : Color.fromARGB(255, 247, 123, 123),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.functions_rounded,
                            size: 40, color: Color.fromARGB(255, 9, 85, 129)),
                        const SizedBox(height: 8),
                        const Text(
                          "Algebra",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Learn how to analyze and interpret data, and make data-driven decisions with our comprehensive statistics courses.",
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => {print("trig")},
              child: MouseRegion(
                  onEnter: (event) => _onEnter(true, 15),
                  onExit: (event) => _onEnter(false, 15),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isHovering13
                          ? Colors.lightBlue[50]
                          : Color.fromARGB(255, 176, 148, 255),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.shape_line_rounded,
                            size: 40, color: Color.fromARGB(255, 9, 85, 129)),
                        const SizedBox(height: 8),
                        const Text(
                          "Trigonometry",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Learn how to analyze and interpret data, and make data-driven decisions with our comprehensive statistics courses.",
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => {print("trig")},
              child: MouseRegion(
                  onEnter: (event) => _onEnter(true, 16),
                  onExit: (event) => _onEnter(false, 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isHovering14
                          ? Colors.lightBlue[50]
                          : Color.fromARGB(255, 238, 113, 165),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.format_shapes_rounded,
                            size: 40, color: Color.fromARGB(255, 9, 85, 129)),
                        const SizedBox(height: 8),
                        const Text(
                          "Solid Geometry",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Learn how to analyze and interpret data, and make data-driven decisions with our comprehensive statistics courses.",
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => {print("calc")},
              child: MouseRegion(
                onEnter: (event) => _onEnter(true, 21),
                onExit: (event) => _onEnter(false, 21),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _isHovering16
                        ? Colors.lightBlue[50]
                        : Color.fromARGB(255, 104, 218, 161),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.area_chart_rounded,
                          size: 40,
                          color: Color.fromARGB(
                              255, 243, 36, 9)), // Added calculator icon
                      const SizedBox(height: 8),
                      const Text(
                        "Calculus",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Learn how to analyze and interpret data, and make data-driven decisions with our comprehensive statistics courses.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }
}

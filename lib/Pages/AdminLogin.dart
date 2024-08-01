import 'package:MathMasters/Config/comHelper.dart';
import 'package:MathMasters/FireBase/UsersDataBase.dart';
import 'package:MathMasters/Pages/About.dart';
import 'package:MathMasters/Pages/Honor.dart';
import 'package:MathMasters/Pages/TeacherPage.dart';
import 'package:MathMasters/Pages/news.dart';
import 'package:MathMasters/Pages/reg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:MathMasters/Config/CustomButtons.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() {
    return _LoginAdminState();
  }
}

class _LoginAdminState extends State<LoginAdmin> {
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
  bool _isHovering100 = false;
  bool _isHovering20 = false;
  bool cemail = false;
  bool cpass = false;
  bool correctdata = false;
  String missingemail = "Student ID";
  String missingpass = "Student Name";
  String stem = "", stpass = "";
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  Createusers lg = Createusers();
  bool _isLoading = false;
  bool _showpure = false;
  bool _showAppliedMath = false;
  @override
  Future<void> initialize() async {
    await Firebase.initializeApp();
    super.initState();
  }

  Future<void> _login(BuildContext context) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final form = _formkey.currentState;
    if (form == null || !form.validate()) {
      setState(() {
        _isLoading = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 20,
            backgroundColor: const Color.fromARGB(255, 255, 249, 208),
            title: const Text('Data Is Missing'),
            content: const Text('Please Enter All Required Data'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
      return;
    }
    try {
      final id = _idController.text;
      final name = _nameController.text;
      if (id.isNotEmpty && name.isNotEmpty) {
        if (id.contains("as")) {
          await lg.loginwithemailandpass(id, name, context, "AS");
        } else if (id.contains("te")) {
          await lg.loginwithemailandpass(id, name, context, "MM");
        } else {
          await lg.loginwithemailandpass(id, name, context, "ST");
        }
      }
    } catch (e) {
      print('Error logging in: $e');
      // Handle error here, such as displaying an error message to the user
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
          _isHovering6 = hover;
        });
        break;
      case 3:
        setState(() {
          _isHovering2 = hover;
        });
        break;
      case 4:
        setState(() {
          _isHovering3 = hover;
        });
        break;
      case 5:
        setState(() {
          _isHovering4 = hover;
        });
        break;
      case 6:
        setState(() {
          _isHovering5 = hover;
        });
        break;
      case 7:
        setState(() {
          _isHovering20 = hover;
        });
        break;
      case 8:
        setState(() {
          _isHovering7 = hover;
        });

        break;
      case 9:
        setState(() {
          _isHovering8 = hover;
        });

        break;
      case 10:
        setState(() {
          _isHovering9 = hover;
        });

        break;
      case 11:
        setState(() {
          _isHovering10 = hover;
        });

        break;
      case 12:
        setState(() {
          _isHovering11 = hover;
        });

        break;
      case 13:
        setState(() {
          _isHovering12 = hover;
        });

        break;
      case 14:
        setState(() {
          _isHovering20 = hover;
        });

        break;
      case 15:
        setState(() {
          _isHovering13 = hover;
        });

        break;
      case 16:
        setState(() {
          _isHovering14 = hover;
        });

        break;
      case 21:
        setState(() {
          _isHovering16 = hover;
        });

        break;
      case 20:
        setState(() {
          _isHovering15 = hover;
        });

        break;
      case 100:
        setState(() {
          _isHovering100 = hover;
        });

        break;
      default:
        break;
    }
  }

  void launchGoogleMaps() async {
    const url =
        'https://www.google.com/maps/search/?api=1&query=30.065057,31.272531';
    html.window.open(url, 'new_tab'); // Use dart:html to open URL in new tab
  }

  void facebook() async {
    const url = 'https://www.facebook.com/profile.php?id=61561225986355';
    html.window.open(url, 'new_tab');
  }

  void youtube() async {
    const url = '';
    html.window.open(url, 'new_tab');
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
          title: Row(children: [
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
            const Spacer(flex: 10),
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
            const Spacer(flex: 10),
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
            const Spacer(flex: 10),
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
            const Spacer(flex: 80),
            Container(
              width: screenWidth * 0.15,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: TextFormField(
                controller: _idController,
                onSaved: (val) => _idController.text = val!,
                obscureText: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          elevation: 20,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 249, 208),
                          title: const Text('Data Is Missing'),
                          content: const Text('Please Enter All Required Data'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                    return "Please Enter Email";
                  }
                  cemail = true;
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  prefixIcon: Icon(Icons.email_rounded),
                  labelText: "Email",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 122, 122, 123)),
                ),
                style: const TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 122, 122, 123)),
                cursorColor: Color.fromARGB(255, 122, 122, 123),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: screenWidth * 0.15,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: TextFormField(
                controller: _nameController,
                autocorrect: true,
                obscureText: true,
                style: const TextStyle(fontSize: 12),
                keyboardType: TextInputType.text,
                cursorColor: const Color.fromARGB(225, 31, 37, 68),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          elevation: 20,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 249, 208),
                          title: const Text('Data Is Missing'),
                          content: const Text('Please Enter All Required Data'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                    return "Please Enter Password";
                  }
                  cpass = true;
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Color.fromARGB(226, 114, 145, 0),
                    ),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                ),
              ),
            ),
            const SizedBox(width: 5),
            _isLoading
                ? const CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 38, 135, 190),
                    color: Color.fromARGB(255, 255, 255, 255),
                  )
                : MouseRegion(
                    onEnter: (event) => _onEnter(true, 15),
                    onExit: (event) => _onEnter(false, 15),
                    child: ArcedSquareButtoncustom(
                      onPressed: () => _login(context),
                      Bourders: 20,
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      ButtonColors: _isHovering13
                          ? const [
                              Color.fromARGB(255, 151, 31, 23),
                              Color.fromARGB(255, 207, 62, 51),
                            ]
                          : const [
                              Color.fromARGB(255, 36, 50, 51),
                              Color.fromARGB(255, 71, 97, 95),
                            ],
                      heights: screenHeight * 0.05,
                      widths: screenWidth * 0.05,
                      label: "Login",
                      textsize: 20,
                      textcolor: Colors.white,
                    ),
                  ),
          ]),
          elevation: 20,
          backgroundColor: const Color.fromARGB(255, 255, 249, 208),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            stem = _idController.text;
            stpass = _nameController.text;
            return SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(children: [
                  Container(
                    color: const Color.fromARGB(255, 21, 32, 26),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.001,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 480,
                          width: 280,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/blob.jpeg',
                                fit: BoxFit.cover,
                                height: 280, // Adjusted height
                                width: 220, // Adjusted width
                                scale: 0.001),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                            child: Center(
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
                              const SizedBox(height: 20),
                              MouseRegion(
                                  onEnter: (event) => _onEnter(true, 10),
                                  onExit: (event) => _onEnter(false, 10),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          _isHovering9
                                              ? Color.fromARGB(
                                                  255, 240, 95, 216)
                                              : Color.fromARGB(
                                                  255, 255, 255, 255),
                                        ),
                                      ),
                                      onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((_) =>
                                                  RegisterPage()))),
                                      child: Text(
                                        "Register Now",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 20),
                                      )))
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
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
                                        onEnter: (event) => _onEnter(true, 2),
                                        onExit: (event) => _onEnter(false, 2),
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
                            )),
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
                            ])))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.01,
                        vertical: screenHeight * 0.001,
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
                        ],
                      )),
                ]),
              ),
            );
          },
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class ViewStudents extends StatefulWidget {
  @override
  _ViewStudentsState createState() => _ViewStudentsState();
}

class _ViewStudentsState extends State<ViewStudents> {
  List<Map<String, dynamic>> userData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  List<bool> _isHovering = [];
  Future<void> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Students').get();
      setState(() {
        var Udata = querySnapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return data;
        }).toList();
        _isHovering = List<bool>.filled(Udata.length, false);
      });
      List<Map<String, dynamic>> tempList = [];
      for (var doc in querySnapshot.docs) {
        DocumentSnapshot marksDoc =
            await doc.reference.collection('Marks').doc('Exam').get();
        tempList.add({
          'name': doc['Name'],
          'class': doc['Class'],
          'examName': marksDoc['Name'],
          'examScore': marksDoc['Score'],
          'date': marksDoc['Date'],
          'comment': marksDoc['Comment'],
          'type': marksDoc['Type']
        });
      }
      setState(() {
        userData = tempList;

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onEnter(bool hover, int num) {
    switch (num) {
      case 0:
        setState(() {
          _isHovering[num] = hover;
        });
        break;
      case 1:
        setState(() {
          _isHovering[num] = hover;
        });
        break;
      case 2:
        setState(() {
          _isHovering[num] = hover;
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 50, 51),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 249, 208),
            title: Center(
                child: Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 36, 50, 51))),
                  onPressed: () => {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 249, 208),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 36, 50, 51))),
                  onPressed: () => {},
                  child: Text(
                    "First Secondary",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 249, 208),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 36, 50, 51))),
                  onPressed: () => {},
                  child: Text(
                    "Second Secondary",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 249, 208),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 36, 50, 51))),
                  onPressed: () => {},
                  child: Text(
                    "Third Secondary",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 249, 208),
                    ),
                  ),
                )
              ],
            ))),
        body: isLoading
            ? const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Loading Data ...",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 249, 208)),
                    ),
                    SizedBox(width: 30),
                    CircularProgressIndicator(
                      color: Color.fromARGB(255, 255, 249, 208),
                      backgroundColor: Colors.blueAccent,
                    )
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  return MouseRegion(
                      onEnter: (_) => _onEnter(true, index),
                      onExit: (_) => _onEnter(false, index),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () => {},
                          child: Card(
                            color: _isHovering[index]
                                ? Color.fromARGB(255, 139, 197, 207)
                                : Color.fromARGB(255, 255, 249, 208),
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${userData[index]['name'] ?? ''}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8.0),
                                  Text(
                                      'Class: ${userData[index]['class'] ?? ''}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 8.0),
                                  Text(
                                      'Exam Name: ${userData[index]['examName'] ?? ''}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 8.0),
                                  Text(
                                      'Exam Score: ${userData[index]['examScore']?.toString() ?? ''}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 8.0),
                                  Text('Date: ${userData[index]['date'] ?? ''}',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 8.0),
                                  Text(
                                      'Comment: ${userData[index]['comment'] ?? ''}',
                                      style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          )));
                },
              ),
      ),
    );
  }
}

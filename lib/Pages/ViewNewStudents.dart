import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewNewStudents extends StatefulWidget {
  @override
  _ViewNewStudentsState createState() => _ViewNewStudentsState();
}

class _ViewNewStudentsState extends State<ViewNewStudents> {
  List<Map<String, dynamic>> userData = [];
  List<bool> _isHovering = [];
  bool isLoading = true;
  String UName = "", UClass = "", UEmail = "";
  bool isAdded = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection('Submission').get();
      setState(() {
        userData = querySnapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id; // Store document ID for later use
          UName = data['Name'];
          UClass = data['Class'];
          UEmail = data['Email'];
          return data;
        }).toList();
        _isHovering = List<bool>.filled(userData.length, false);
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _setOld(String docId, int index) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore
          .collection('Submission')
          .doc(docId)
          .update({'Type': 'Old'});
      setState(() {
        userData[index]['Type'] = 'Old';
      });
    } catch (e) {
      print('Error updating status: $e');
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

  Future<void> _addNewStudent(
    String ID,
    String Name,
    String Email,
    String Class,
  ) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    bool isAdded = false;

    try {
      // Create user in Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: Email,
        password:
            ID, // Using ID as password for simplicity; consider a stronger password policy
      );

      // If user creation is successful, add user details to Firestore
      Map<String, dynamic> data = {
        "ID": ID,
        "Name": Name,
        "Email": Email,
        "Class": Class,
        "AuthUID": userCredential.user?.uid,
      };

      Map<String, dynamic> examData = {
        "Comment": "None",
        "Name": "None",
        "Score": "0/30",
        "Type": "None",
        "Date": "0/0/0",
      };

      CollectionReference submissions =
          FirebaseFirestore.instance.collection('Students');
      await submissions.doc(ID).set(data);

      CollectionReference examsCollection =
          submissions.doc(ID).collection('Marks');
      await examsCollection.doc("Exam").set(examData);

      // If all operations are successful, update the state
      setState(() {
        isAdded = true;
      });

      print("Student and marks added successfully");
    } catch (e) {
      setState(() {
        isAdded = false;
      });

      print("Failed to add student or marks: $e");
    }
  }

  TextEditingController newTaskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 201, 201, 201),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 216, 209, 161),
          title: const Center(
            child: Text(
              'New Students',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
        body: isLoading
            ? const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Loading Data ...",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(width: 30),
                    CircularProgressIndicator()
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  return MouseRegion(
                    cursor: userData[index]['Type'] == 'New'
                        ? SystemMouseCursors.click
                        : SystemMouseCursors.basic,
                    onEnter: (_) => _onEnter(true, index),
                    onExit: (_) => _onEnter(false, index),
                    child: GestureDetector(
                      onTap: () {
                        userData[index]['Type'] == 'New'
                            ? showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Student ID',
                                        style: TextStyle(fontSize: 20)),
                                    content: TextField(
                                      controller: newTaskController,
                                      decoration: const InputDecoration(
                                        labelText: 'SID',
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Cancel',
                                            style: TextStyle(fontSize: 20)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Add',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red)),
                                        onPressed: () {
                                          _addNewStudent(
                                            newTaskController.text.trim(),
                                            UName,
                                            UEmail,
                                            UClass,
                                          );
                                          newTaskController.clear();
                                          _setOld(userData[index]['id'], index);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              )
                            : () => {};
                      },
                      child: Card(
                        color: userData[index]['Type'] == 'New' && !isAdded
                            ? const Color.fromARGB(255, 255, 149, 142)
                            : Color.fromARGB(255, 216, 209, 161),
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          color: _isHovering[index]
                              ? Color.fromARGB(255, 223, 183, 255)
                              : Colors.white54,
                          child: ListTile(
                            title: Text(
                              userData[index]['Name'] ?? '',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 17, 93, 180),
                                  fontSize: 25),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'PNumber: ${userData[index]['Parent Number']?.toString() ?? ''}',
                                    style: TextStyle(fontSize: 20)),
                                Text(
                                    'SNumber: ${userData[index]['Student Number']?.toString() ?? ''}',
                                    style: TextStyle(fontSize: 20)),
                                Text(
                                    'Student Email: ${userData[index]['Email'] ?? ''}',
                                    style: TextStyle(fontSize: 20)),
                                Text('Class: ${userData[index]['Class'] ?? ''}',
                                    style: TextStyle(fontSize: 20)),
                                Text(
                                    'Address: ${userData[index]['Address'] ?? ''}',
                                    style: TextStyle(fontSize: 20)),
                                Text(
                                    'Learning Type: ${userData[index]['Learning Type'] ?? ''}',
                                    style: TextStyle(fontSize: 20)),
                              ],
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
  }
}

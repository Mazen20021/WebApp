import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewAssistant extends StatefulWidget {
  @override
  _ViewAssistantState createState() => _ViewAssistantState();
}

class _ViewAssistantState extends State<ViewAssistant> {
  List<Map<String, dynamic>> userData = [];
  TextEditingController newTaskController = TextEditingController();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Assistance').get();

      List<Map<String, dynamic>> tempList = [];
      for (var doc in querySnapshot.docs) {
        tempList.add({
          'ID': doc.id,
          'Name': doc['Name'],
          'Students': doc["AStudents"],
          'Tasks': doc['Tasks'],
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

  Future<void> addTask(String assistantId, String newTask) async {
    try {
      DocumentReference assistantRef =
          FirebaseFirestore.instance.collection('Assistance').doc(assistantId);

      await assistantRef.update({
        'Tasks': FieldValue.arrayUnion([newTask])
      });

      fetchData();
    } catch (e) {}
  }

  Future<void> deleteTask(String assistantId, String task) async {
    try {
      DocumentReference assistantRef =
          FirebaseFirestore.instance.collection('Assistance').doc(assistantId);

      await assistantRef.update({
        'Tasks': FieldValue.arrayRemove([task])
      });

      fetchData();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 216, 209, 161),
          title: const Center(
            child: Text(
              'Assistants',
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
                padding: const EdgeInsets.all(16.0),
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  List<String> astudents = userData[index]['Students'] != null
                      ? List.from(userData[index]['Students'])
                      : [];
                  List<String> tasks = userData[index]['Tasks'] != null
                      ? List.from(userData[index]['Tasks'])
                      : [];

                  return Card(
                    color: Color.fromARGB(255, 216, 209, 161),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${userData[index]['Name'] ?? ''}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8.0),
                          Text(
                              'Assigned Students: ${astudents.isNotEmpty ? astudents.join(', ') : ''}',
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 8.0),
                          Text(
                              'Tasks: ${tasks.isNotEmpty ? tasks.join(', ') : ''}',
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 8.0),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('New Task',
                                          style: TextStyle(fontSize: 20)),
                                      content: TextField(
                                        controller: newTaskController,
                                        decoration: const InputDecoration(
                                          labelText: 'Task',
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
                                            addTask(userData[index]['ID'],
                                                newTaskController.text.trim());
                                            newTaskController.clear();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text('Add New Task',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0))),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                              child: Text(
                            "Current Tasks Are",
                            style: TextStyle(fontSize: 35),
                          )),
                          for (var task in tasks)
                            ListTile(
                              title: Text(task),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  deleteTask(userData[index]['ID'], task);
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _SN = '';
  String _PN = '';
  String _address = '';
  String _SchN = '';
  String _Class = '';
  String _LTYPE = '';
  bool isSuccess = false;
  String _selectedClass = ' Choose your Grade';
  String _selectedType = ' How do you want to learn ?';
  String _errorMessage = '';
  String _errorMessage1 = '';
  String _errorMessage2 = '';

  void saveindb(String name, String sn, String pn, String schN,
      String selectedClass, String ltype, String email, String address) async {
    // Create a reference to the Firestore collection
    CollectionReference submissions =
        FirebaseFirestore.instance.collection('Submission');
    try {
      await submissions.add({
        'Name': name,
        'Student Number': sn,
        'Parent Number': pn,
        'School Name': schN,
        'Class': selectedClass,
        'Learning Type': ltype,
        'Email': email,
        'Address': address,
        'Type': "New"
      });
      setState(() {
        isSuccess = true;
      });
    } catch (e) {
      setState(() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Could not Add This Student Dueto :${e} ',
                  style: TextStyle(fontSize: 20),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK', style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
        isSuccess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 50, 51),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Registration Form",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 800,
                    child: SingleChildScrollView(
                        child: Card(
                            margin: EdgeInsets.symmetric(),
                            elevation: 10,
                            color: Color.fromARGB(255, 255, 249, 208),
                            child: Column(children: [
                              TextFormField(
                                style: TextStyle(fontSize: 30),
                                decoration:
                                    InputDecoration(labelText: ' Full Name *'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _name = value!;
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                style: TextStyle(fontSize: 30),
                                decoration: InputDecoration(
                                    labelText: ' Student Email *'),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  setState(() {
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      _errorMessage =
                                          'Please enter a valid email address';
                                    } else {
                                      _errorMessage = '';
                                    }
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _email = value!;
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              if (_errorMessage.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    _errorMessage,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              TextFormField(
                                maxLength: 11,
                                style: TextStyle(fontSize: 30),
                                onChanged: (value1) {
                                  setState(() {
                                    if (value1.isEmpty ||
                                        value1.length < 11 ||
                                        !(value1.startsWith("010") ||
                                            !value1.startsWith("011") ||
                                            !value1.startsWith("012"))) {
                                      _errorMessage1 =
                                          'Please enter the number correctly';
                                    } else {
                                      _errorMessage1 = '';
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                    labelText: ' Student WhatsApp Number *'),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 11 ||
                                      !(value.startsWith("010") ||
                                          !value.startsWith("011") ||
                                          !value.startsWith("012"))) {
                                    return 'Please enter your number correctly';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _SN = value!;
                                },
                              ),
                              if (_errorMessage1.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    _errorMessage1,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                maxLength: 11,
                                style: TextStyle(fontSize: 30),
                                onChanged: (value2) {
                                  setState(() {
                                    if (value2.isEmpty ||
                                        value2.length < 11 ||
                                        !(value2.startsWith("010") ||
                                            !value2.startsWith("011") ||
                                            !value2.startsWith("012"))) {
                                      _errorMessage2 =
                                          'Please enter the number correctly';
                                    } else {
                                      _errorMessage2 = '';
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                    labelText: ' Parent WhatsApp Number *'),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 11) {
                                    return 'Please enter the number correctly';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _PN = value!;
                                },
                              ),
                              if (_errorMessage2.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    _errorMessage2,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                style: TextStyle(fontSize: 30),
                                decoration:
                                    InputDecoration(labelText: ' Address *'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your address';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _address = value!;
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                style: TextStyle(fontSize: 30),
                                decoration: InputDecoration(
                                    labelText: ' School Name *'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your school name';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _SchN = value!;
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              DropdownButtonFormField<String>(
                                dropdownColor:
                                    Color.fromARGB(255, 235, 235, 235),
                                value: _selectedClass,
                                decoration: InputDecoration(
                                    labelText: '  Your Grade *'),
                                items: [
                                  ' Choose your Grade',
                                  ' First Secondary',
                                  ' Second Secondary(Art)',
                                  ' Second Secondary(Scientific)',
                                  ' Third Secondary'
                                ].map((String className) {
                                  return DropdownMenuItem<String>(
                                    value: className,
                                    child: Text(className),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedClass = newValue!;
                                  });
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value == "Choose your class") {
                                    return 'Please select a class';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _Class = newValue!;
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              DropdownButtonFormField<String>(
                                dropdownColor:
                                    Color.fromARGB(255, 235, 235, 235),
                                value: _selectedType,
                                decoration: InputDecoration(
                                    labelText: '  Way Of Learning *'),
                                items: [
                                  ' How do you want to learn ?',
                                  ' Offline at Center',
                                  ' Online Videos'
                                ].map((String role) {
                                  return DropdownMenuItem<String>(
                                    value: role,
                                    child: Text(role),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedType = newValue!;
                                  });
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value == "How do you want to learn ?") {
                                    return 'Please select a learning type';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _LTYPE = newValue!;
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(height: 20),
                              isSuccess
                                  ? Center(
                                      child: Text(
                                      "Your Submission has been sent. We will contact you soon!",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color:
                                              Color.fromARGB(255, 41, 42, 43)),
                                    ))
                                  : TextButton.icon(
                                      icon: Icon(
                                        Icons.add,
                                        size: 50,
                                        color: Color.fromARGB(255, 30, 30, 31),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          saveindb(_name, _SN, _PN, _SchN,
                                              _Class, _LTYPE, _email, _address);
                                        }
                                      },
                                      label: Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontSize: 35,
                                            color: Color.fromARGB(
                                                255, 43, 44, 44)),
                                      ),
                                    ),
                            ])))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

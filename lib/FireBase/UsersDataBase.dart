import 'package:MathMasters/Pages/AuthoCheck.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Createusers {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool is_loggedin = false;

  Createusers() {
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      print("Firebase initialized successfully");
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  }

  void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future<void> signInWithEmailAndPassword(String email, String password,
      String userID, String name, String document) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        print("User signed in: ${user.email}");
        await loginUser(userID, name, document);
      } else {
        print("No user returned from sign-in");
      }
    } on FirebaseAuthException catch (e) {
      print("Error signing in: ${e.message}");
    } catch (e) {
      print("Unexpected error signing in: $e");
    }
  }

  Future<void> loginUser(String userID, String name, String document) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection(document).doc(userID).get();

      if (!snapshot.exists) {
        print("Document does not exist");
        is_loggedin = false;
        return;
      }

      String storedId = snapshot.get("ID");
      String email = snapshot.get("Email");
      String password = snapshot.get("Password");
      String userName = snapshot.get("Name");
      User? user = _auth.currentUser;

      if (user != null && storedId == userID && userName == name) {
        print("User is logged in");
        is_loggedin = true;
      } else {
        // Sign in again only if the current user is not the same
        print("User information does not match, signing in again");
        await signInWithEmailAndPassword(
            email, password, userID, userName, document);
      }
    } catch (error) {
      is_loggedin = false;
      print("Error logging in: $error");
    }
  }

  void createuserwithemailandpass(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Success',
            style: TextStyle(fontSize: 20),
          ),
          content: const Text(
            'User Created Successfully !',
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("password is weak");
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'Error',
              style: TextStyle(fontSize: 20),
            ),
            content: const Text(
              'This User Exists Already!',
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Error',
            style: TextStyle(fontSize: 20),
          ),
          content: Text(
            'Error 404 Dueto ${e}',
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  Future<void> loginwithemailandpass(
      String Email, String Pass, BuildContext context, String role) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Pass);
      switch (role) {
        case "MM":
          Navigator.push(context,
              MaterialPageRoute(builder: ((_) => const AuthCheck(Role: "MM"))));
          break;
        case "AS":
          Navigator.push(context,
              MaterialPageRoute(builder: ((_) => const AuthCheck(Role: "AS"))));
          break;
        case "ST":
          Navigator.push(context,
              MaterialPageRoute(builder: ((_) => const AuthCheck(Role: "ST"))));
          break;
        default:
          Navigator.push(context,
              MaterialPageRoute(builder: ((_) => const AuthCheck(Role: ""))));
          break;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'Email Not Found',
              style: TextStyle(fontSize: 20),
            ),
            content: Text(
              ' This Email Is Not Found Please SignUp Or Try Again With Vaild Email',
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'Password Not Correct',
              style: TextStyle(fontSize: 20),
            ),
            content: Text(
              ' This Password Is Not Found Please Try Again With Vaild Password',
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'Error',
                    style: TextStyle(fontSize: 20),
                  ),
                  content: Text(
                    'This User Is Not Found You may Signup or Try again later!',
                    style: TextStyle(fontSize: 20),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ));
      }
    }
  }
}

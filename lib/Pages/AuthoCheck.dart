import 'package:MathMasters/Pages/AdminLogin.dart';
import 'package:MathMasters/unusedpages/Mainmenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:MathMasters/Pages/AssistantPage.dart';
import 'package:MathMasters/Pages/MainPageAfterLogIN.dart';
import 'package:MathMasters/Pages/TeacherPage.dart';

class AuthCheck extends StatelessWidget {
  final String Role;
  const AuthCheck({required this.Role, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          switch (Role) {
            case 'MM':
              return const Teacherpage();
            case 'ST':
              return MainpageALG();
            case 'AS':
              return const Assistant(); // Default case if no role matches
          }
        }
        return const Teacherpage();
        //const LoginAdmin();
      },
    );
  }
}

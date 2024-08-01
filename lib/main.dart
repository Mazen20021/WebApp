import 'package:MathMasters/Pages/AuthoCheck.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:MathMasters/Pages/AssistantPage.dart';
import 'package:MathMasters/Pages/MainPageAfterLogIN.dart';
import 'package:MathMasters/Pages/TeacherPage.dart';
import 'package:MathMasters/Pages/AdminLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Mathmasters());
}

class Mathmasters extends StatelessWidget {
  const Mathmasters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthCheck(Role: ""),
        '/login': (context) => const LoginAdmin(),
        '/main': (context) => MainpageALG(),
        '/teacher': (context) => const Teacherpage(),
        '/assistant': (context) => const Assistant(),
      },
    );
  }
}

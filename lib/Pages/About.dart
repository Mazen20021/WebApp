import 'package:MathMasters/unusedpages/Mainmenu.dart';
import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 50, 51),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 249, 208),
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // For small screens
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Our Team",
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Our Team",
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Wrap(
                spacing: 50,
                runSpacing: 0,
                alignment: WrapAlignment.center,
                children: [
                  _buildInfoCard(
                      context: context,
                      onTap: () => {},
                      image: 'assets/images/Devops.png',
                      name: "Eng: Mazen Ahmed",
                      description: "Faculty of Engineering",
                      role: "Technincal Support"),
                  _buildInfoCard_others(
                      onTap: () => {},
                      context: context,
                      image: 'assets/images/Mahmoud.png',
                      name: "Eng: Mahmoud Adway",
                      description: "Eng",
                      role: "Assistant Team Leader"),
                  _buildInfoCard_others(
                      onTap: () => {},
                      context: context,
                      image: 'assets/images/Yassin.png',
                      name: "Yassin Tarek",
                      description: "Eng",
                      role: "Assistant"),
                  _buildInfoCard(
                      onTap: () => {},
                      context: context,
                      image: 'assets/images/person.png',
                      name: "Ethar",
                      description: "Eng",
                      role: "Assistant"),
                  _buildInfoCard(
                      onTap: () => {},
                      context: context,
                      image: 'assets/images/person.png',
                      name: "Mohamed El-Sayed",
                      description: "Eng",
                      role: "Assistant"),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }

  Widget _buildInfoCard({
    required String name,
    required String role,
    required String description,
    required Function() onTap,
    //required Color colors,
    // required Color textColor,
    // required Widget icon,
    required String image,
    required BuildContext context,
  }) {
    return Column(children: [
      const SizedBox(height: 60),
      InkWell(
        borderRadius: BorderRadius.circular(50),
        hoverColor: Color.fromARGB(26, 255, 255, 255),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 350,
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    image,
                    height: 200,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  role,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 249, 208),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 249, 208),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

Widget _buildInfoCard_others({
  required String name,
  required String role,
  required String description,
  required Function() onTap,
  required String image,
  required BuildContext context,
}) {
  return Column(
    children: [
      const SizedBox(height: 60),
      InkWell(
        borderRadius: BorderRadius.circular(50),
        hoverColor: Color.fromARGB(26, 255, 255, 255),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 350,
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ClipOval(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  role,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 249, 208),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 249, 208),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget infoCard({
  required String title,
  required String content,
  required Function() onTap,
  required Color colors,
  required Color textColor,
  required Widget icon,
  required Widget image,
  required BuildContext context,
}) {
  final screenWidth = MediaQuery.of(context).size.width;

  return InkWell(
    onTap: onTap,
    child: Card(
      margin: const EdgeInsets.all(10),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: colors,
      elevation: 20,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 350,
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                icon,
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                  child: ClipOval(
                child: image,
              )),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

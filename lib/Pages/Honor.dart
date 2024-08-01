import 'package:MathMasters/unusedpages/Mainmenu.dart';
import 'package:flutter/material.dart';

class Honors extends StatelessWidget {
  const Honors({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 50, 51),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 249, 208),
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // For small screens
              return const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_border_purple500,
                      size: 20,
                      color: Color.fromARGB(255, 170, 4, 185),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Honor Board",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.star_border_purple500,
                      size: 20,
                      color: Color.fromARGB(255, 170, 4, 185),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_border_purple500,
                      size: 35,
                      color: Color.fromARGB(255, 170, 4, 185),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Honor Board",
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.star_border_purple500,
                      size: 35,
                      color: Color.fromARGB(255, 170, 4, 185),
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
                  _buildInfoCard(context),
                  _buildInfoCard(context),
                  _buildInfoCard(context),
                  _buildInfoCard(context),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }

  Widget _buildInfoCard(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 100),
      Container(
        padding: const EdgeInsets.all(20),
        width: 350,
        height: 350,
        child: Card(
          color: const Color.fromARGB(255, 255, 249, 208).withOpacity(0.9),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/person.png',
                    height: 100,
                    filterQuality: FilterQuality.medium,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "DR ELbana",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "Ain Shams Uni",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 25),
                IconButton(
                  icon: const Icon(
                    Icons.view_carousel_rounded,
                    size: 50,
                  ),
                  onPressed: () {
                    // Handle card tap here
                    print("About card tapped");
                  },
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
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

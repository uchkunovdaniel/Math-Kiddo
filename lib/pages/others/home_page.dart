import 'package:flutter/material.dart';
import 'package:mathkiddo/pages/grades/first_grade.dart';
import 'package:mathkiddo/pages/grades/second_grade.dart';
import 'package:mathkiddo/pages/grades/third_grade.dart';
import 'package:mathkiddo/pages/grades/fourth_grade.dart';
import 'package:mathkiddo/pages/others/info.dart';
import 'package:mathkiddo/pages/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'MathKiddo',
          style: appBarTextStyle,
        ),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Image.asset('lib/images/logoForMathKiddo.png'),
          // Ensure this path is correct
          Expanded(
            child: ListView(
              itemExtent: 115,
              children: [
                Padding(
                  padding: itemPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      color: levelColors[0],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        "Задачи за първи клас",style: levelTitleTextStyle,
                      ),
                      subtitle: Text("Натиснете тук!", style: levelSubtitleTextStyle,),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstGrade()),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: itemPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      color: levelColors[1],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Задачи за втори клас", style: levelTitleTextStyle),
                      subtitle: Text("Натиснете тук!", style: levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SecondGrade()),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: itemPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      color: levelColors[2],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Задачи за трети клас", style: levelTitleTextStyle),
                      subtitle: Text("Натиснете тук!",style: levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ThirdGrade()),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: itemPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      color: levelColors[3],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Задачи за четвърти клас",style: levelTitleTextStyle),
                      subtitle: Text("Натиснете тук!",style: levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FourthGrade()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: appBarColor,
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text(
                    'MathKiddo',
                    style: TextStyle(fontSize: 35, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  'Начална страница',
                  style: TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
              ),
              const SizedBox(height: 25),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  'За профила',
                  style: TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Info(),
                  ));
                },

              ),
              const SizedBox(height: 25),
              ListTile(
              leading: const Icon(Icons.contrast),
              title: const Text(
                  'Синя тема',
                  style: TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                ),
              onTap: () {
                blueTheme();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              },
              ),
            const SizedBox(height: 25),
            ListTile(
            leading: const Icon(Icons.contrast),
            title: const Text(
            'Розова тема',
            style: TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
            ),
            onTap: () {
              pinkTheme();
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          }
            ),
              const SizedBox(height: 25),
              ListTile(
                  leading: const Icon(Icons.contrast),
                  title: const Text(
                    'Сива тема',
                    style: TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                  onTap: () {
                    greyTheme();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  }
              )],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mathkiddo/main.dart';
import 'package:mathkiddo/pages/authPages/auth_page.dart';
import 'package:mathkiddo/pages/theme.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

signUserOut(BuildContext context) {
  FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const AuthPage()),
  );
  progress = 0;
  for (var key in progressdict.keys) {
    for (var key2 in progressdict[key]!.keys) {
      progressdict[key]![key2] = false;
    }
  }
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 400,
              child:         LinearProgressIndicator(
                  value: progress/60, minHeight: 50, borderRadius: BorderRadius.circular(20)),
            ),
            Text(
              "\nПрогрес: $progress/60\n\n\n\n",
              style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
            ),
            OutlinedButton(
              onPressed: (){signUserOut(context);},
              style: OutlinedButton.styleFrom(
                foregroundColor: scaffoldBackgroundColor,
                backgroundColor: appBarColor,
                side: const BorderSide(color: Color.fromARGB(255, 227, 240, 240)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Increase padding for bigger button
                textStyle: const TextStyle(fontSize: 18), // Increase font size for larger text
              ),
              child: const Text(
                "Изход от профила",
                style: TextStyle(fontFamily: 'RobotoSlab-Regular'),
              ),
            ),
            const SizedBox(height: 80), // Add some space between the button and the text
            const Text(
              "Изработено от: ",
              style: TextStyle(fontSize: 16, fontFamily: 'RobotoSlab-Regular'),
            ),
            const SizedBox(height: 5), // Add a small space between the "Contact me" text and the email
            const Text(
              "Снежана Минчева, \nДаниел Учкунов\nПГЕЕ - гр. Пловдив",
              style: TextStyle(fontSize: 16, fontFamily: 'RobotoSlab-Regular'),
            ),
            const SizedBox(height: 40), // Add some space between the email and the "made by" text
            const Text(
              "Свържете се с нас: ",
              style: TextStyle(fontSize: 16, fontFamily: 'RobotoSlab-Regular'),
            ),
            const SizedBox(height: 5), // Add a small space between the "made by" text and the name
            const Text(
              "s.mincheva22@gmail.com\ndanieluchkunov5@gmail.com",
              style: TextStyle(fontSize: 16, fontFamily: 'RobotoSlab-Regular'),
            ),
          ],
        ),
      ),
    );
  }
}

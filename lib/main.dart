import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mathkiddo/pages/others/firebase_options.dart';
import 'package:mathkiddo/pages/authPages/auth_page.dart';
import 'package:mathkiddo/pages/questions.dart';
import 'package:mathkiddo/pages/theme.dart';

//ly

int progress = 0;
var progressdict = {'Grade1Level1': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade1Level2': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade1Level3': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade1Level4': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade1Level5': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade2Level1': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade2Level2': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade2Level3': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade2Level4': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade2Level5': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade3Level1': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade3Level2': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade3Level3': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade3Level4': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade3Level5': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade4Level1': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade4Level2': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade4Level3': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade4Level4': {'Question1': false, 'Question2': false, 'Question3': false}, 'Grade4Level5': {'Question1': false, 'Question2': false, 'Question3': false}};
var  questions = <String, List<Map<String, dynamic>>>{};
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "mathkiddo",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  questions = await getAllQuestions();
  greyTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}


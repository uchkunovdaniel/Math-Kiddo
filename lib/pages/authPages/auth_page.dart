import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mathkiddo/pages/authPages/log_in_or_register_page.dart';
import '../others/home_page.dart';

class AuthPage extends StatelessWidget{
  const AuthPage({super.key});


  @override 
  Widget build (BuildContext context){
    return Scaffold(
      body: StreamBuilder <User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //потребителят е в профил
          if (snapshot.hasData){
            return const HomePage();
          }
          //потребителят не е в профил
          else  {
            return const LoginOrRegisterPage();
          }
        },
        ),
      );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mathkiddo/components/my_text_field.dart';
import 'package:mathkiddo/pages/theme.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
final emailController = TextEditingController();

@override
void dispose (){
  emailController.dispose();
  super.dispose();
}


Future passwordReset () async {
  try {
  await FirebaseAuth.instance.sendPasswordResetEmail
  (email: emailController.text.trim());
  // ignore: use_build_context_synchronously
  showDialog(context: context, builder: (context){
    return const AlertDialog(
      content: Text('Изпратен е линк за създаване на нова парола!', style: TextStyle(fontFamily: 'RobotoSlab-Regular'),),
    );
  });
  } on FirebaseAuthException catch (e){
  // ignore: use_build_context_synchronously
  showDialog(context: context, builder: (context){
    return AlertDialog(
      content: Text(e.message.toString()),
    );
  });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
      ),
      
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text('Въведете своя имейл и ще получите линк за създаване на нова парола',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'RobotoSlab-Regular'),),
        ),
        const SizedBox(height: 10),
        // email
         MyTextField(
          controller: emailController,
          hintText: 'Имейл',
          obscureText: false,
       ),
      const SizedBox(height: 10),

       MaterialButton(onPressed: passwordReset,
       color: appBarColor,
       child: const Text('Създаване на парола') )
      ],),
    );
  }
}
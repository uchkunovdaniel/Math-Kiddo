
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mathkiddo/components/my_text_field.dart';
import 'package:mathkiddo/components/sign_in_button.dart';

import '../theme.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage ({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
// контролери за промяна или редакция на текст
final emailController = TextEditingController();

final passwordController = TextEditingController();

final confirmPasswordController = TextEditingController();

// метод за влизане
void signUserUp() async {

//зареждане с въртящо се кръгче
showDialog(context: context, 
builder: (context){
  return const Center(
    child: CircularProgressIndicator(),
  );
},
);

//опит за създаване на потребител
try{
  //дали е потвърдена паролата
  if(passwordController.text == confirmPasswordController.text){
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
  email: emailController.text, 
  password: passwordController.text,
    );
  } else {
    //грешка при еднаквостта на паролите
    showErrorMessage("Паролите не са еднакви");
  }

 //спиране на кръгчето
  // ignore: use_build_context_synchronously
  Navigator.pop(context);

} on FirebaseAuthException catch (e){
  
   //спиране на кръгчето
  // ignore: use_build_context_synchronously
  Navigator.pop(context);

  //съобщение за грешка
  showErrorMessage(
    e.code
  );
}
}

//Pop-up за грешни данни
void showErrorMessage(String message){
  showDialog(context:context , builder:(context)
  {
    return AlertDialog(
      title: Center(
     child: Text (message,
     style: const TextStyle(color: Colors.black38)),
    ));
  },
  );
}

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 246, 247),
      body : SafeArea(
        child : Center(
          child: SingleChildScrollView(
        child : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
        const SizedBox(height: 30),

        // лого
          const Image(
            image: AssetImage('lib/images/logoForMathKiddo.png'),
            ),
            const SizedBox(height: 5),

        // направа на профил
        const Text(
          'Нека си направим профил!',
          style: TextStyle(
            color: Color.fromARGB(221, 57, 44, 44),
            fontSize: 26,
            fontFamily: 'RobotoSlab-Regular'
            ),
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 30),

        // имейл име
       MyTextField(
          controller: emailController,
          hintText: 'Имейл',
          obscureText: false,
       ),
      
       const SizedBox(height: 10),


        // парола
       MyTextField(
        controller: passwordController,
        hintText: 'Парола',
        obscureText: true,
      ),

      const SizedBox(height: 10),

      // парола
       MyTextField(
        controller: confirmPasswordController,
        hintText: 'Потвърди парола',
        obscureText: true,
      ),
  
       const SizedBox(height: 25),

              // бутон за регистрация
              MyButton(
                text: 'Регистрация',
                onTap: signUserUp,
              ),

              const SizedBox(height: 50),
      
        // направи си регистрация
        
            const Text('Имате профил?',
            style: TextStyle(color: Color.fromARGB(221, 57, 44, 44), fontFamily: 'RobotoSlab-Regular')),
            const SizedBox(width: 4),
             GestureDetector(
              onTap: widget.onTap,
              child: Text('Вход в профила!',
              style: TextStyle(
                color: appBarColor,
                fontWeight: FontWeight.bold, fontFamily: 'RobotoSlab-Regular'
              ),
                      ),
            ),
      ],
        )
      ),
    ),
    ),
    );
    
  }
}


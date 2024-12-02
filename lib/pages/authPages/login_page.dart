
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mathkiddo/components/my_text_field.dart';
import 'package:mathkiddo/components/sign_in_button.dart';
import 'package:mathkiddo/pages/authPages/forgot_password_page.dart';
import 'package:mathkiddo/pages/theme.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage ({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// контролери за промяна или редакция на текст
final emailController = TextEditingController();

final passwordController = TextEditingController();

// метод за продължаване напред / влизане
void signUserIn() async {

//зареждане с въртящо се кръгче
showDialog(context: context, 
builder: (context){
  return const Center(
    child: CircularProgressIndicator(),
  );
},
);

//опит за регистриране на потребител
try{
  await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailController.text, 
  password: passwordController.text,
  );

} on FirebaseAuthException catch (e){
  

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
        const SizedBox(height: 40),

        // лого
          const Image(
            image: AssetImage('lib/images/logoForMathKiddo.png'),
            ),
            const SizedBox(height: 10),

        // здравейте
        const Text(
          'Здравейте!',
          style: TextStyle(
            color: Color.fromARGB(221, 57, 44, 44),
            fontSize: 26,
            fontFamily: 'RobotoSlab-Regular'
            ),
          ),
        const SizedBox(height: 40),

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

        // забравена парола
        Padding (
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment : MainAxisAlignment.end,
            children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const ForgotPasswordPage();
              },),);
            },
            child: const Text('Забравена парола?',
                    style: TextStyle(color:Color.fromARGB(221, 57, 44, 44),
                    fontWeight: FontWeight.bold , fontFamily: 'RobotoSlab-Regular'),
                    ),
          )
            ],
          ),
        ),
       
       const SizedBox(height: 25),

              // бутон за регистрация
              MyButton(
                text: 'Вход',
                onTap: signUserIn,
              ),

              const SizedBox(height: 50),
      
        // направи си регистрация
        
           Row(
          mainAxisAlignment:MainAxisAlignment.center,
              children:[
                const Text('Нямате профил?',
                style:TextStyle(color:Color.fromARGB(221, 57, 44, 44), fontFamily: 'RobotoSlab-Regular')),
                  const SizedBox(width: 4),
                    GestureDetector(
                          onTap:widget.onTap,
                            child: Text(
                            'Направете си регистрация!',
                              style:TextStyle(color: appBarColor,
                              fontWeight:FontWeight.bold,
                              fontFamily: 'RobotoSlab-Regular'
                            ),
                          ),
                        ),
                      ],
                    )
        ],

            ),
      
        )
      ),
    ),
    );
    
  }
}


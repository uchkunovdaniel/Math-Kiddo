import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white12,
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [ 
            Image(image: AssetImage('lib/images/firstForC.png'), height: 150,  fit: BoxFit.cover),
            Image(image: AssetImage('lib/images/secondForC.png'), height: 150,  fit: BoxFit.cover),
            Image(image: AssetImage('lib/images/thirdForC.png'), height: 150,  fit: BoxFit.cover),
            Image(image: AssetImage('lib/images/fourthForC.png'), height: 150,  fit: BoxFit.cover),
          ],
        ),
        appBar: AppBar(
        backgroundColor: const Color.fromRGBO(220, 237, 193, 1),
        elevation: 0,
      ),
      ),
    );
  }
}
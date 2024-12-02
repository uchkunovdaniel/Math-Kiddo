import 'package:flutter/material.dart';
import 'package:mathkiddo/pages/theme.dart';
import 'package:mathkiddo/main.dart';

//MAIN PAGE

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Math Quiz',
      home: Q1SecondGrade(),
    );
  }
}

class _SecondGradeState extends State<SecondGrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Втори клас", style:  appBarTextStyle),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Image.asset('lib/images/koalaFf2.png', height: 150,), // Ensure this path is correct
          Expanded(
            child: ListView(
              itemExtent: 112,
              children: [
                Padding(
                  padding: itemPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      color: levelColors[0],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Първо ниво", style: levelTitleTextStyle),
                      subtitle: Text("Натиснете тук!", style: levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Q1SecondGrade()),
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
                      title: Text("Второ ниво", style: levelTitleTextStyle),
                      subtitle: Text("Натиснете тук!", style: levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Q2SecondGrade()),
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
                      title: Text("Трето ниво", style: levelTitleTextStyle),
                      subtitle: Text("Натиснете тук!", style: levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Q3SecondGrade()),
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
                      title: Text("Четвърто ниво", style: levelTitleTextStyle),
                      subtitle: Text("Натиснете тук!", style: levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Q4SecondGrade()),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: itemPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      color: levelColors[4],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text("Пето ниво", style: levelTitleTextStyle),
                      subtitle: Text("Натиснете тук!", style: levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Q5SecondGrade()),
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
    );
  }
}

class SecondGrade extends StatefulWidget {
  const SecondGrade({super.key});

  @override
  State<SecondGrade> createState() => _SecondGradeState();
}

//STATES

class Q1SecondGradeState extends State<Q1SecondGrade> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (questions["grade2Level1"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade2Level1"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade2Level1"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade2Level1"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade2Level1"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetQuiz();
                  },
                  child: const Text('Направи отново', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }
  void _showHelpDialog() {
    String helpText = '';
    if (_questionIndex == 0) {
      helpText = 'Колко см е 1dm...';
    } else if (_questionIndex == 1) {
      helpText = '...';
    } else if (_questionIndex == 2) {
      helpText = 'Превърни мерните единици...';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Помощ', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
          content: Text(helpText, style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Разбрах!', style: TextStyle(color:  appBarColor, fontFamily: 'LXGWWenKaiMonoTC')),
            ),
          ],
        );
      },
    );
  }


  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Q2SecondGrade()),
    );
  }

  void _closeAllLevels() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: levelColors[0],
        appBar: AppBar(
          backgroundColor: levelColors[0],
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _closeAllLevels,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 180,),
                Center(
                  child: Text(
                    questions["grade2Level1"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade2Level1"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular'),),
                  );
                }),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _showHelpDialog,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: levelColors[0],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Помощ',
                            style: TextStyle(color: Colors.black,
                                fontStyle: FontStyle.italic, fontFamily: 'LXGWWenKaiMonoTC'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 80,),
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text('Следваща задача', style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво', style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q2SecondGradeState extends State<Q2SecondGrade> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (questions["grade2Level2"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade2Level2"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade2Level2"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade2Level2"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade2Level2"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetQuiz();
                  },
                  child: const Text('Направи отново', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }


  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Q3SecondGrade()),
    );
  }

  void _closeAllLevels() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: levelColors[1],
        appBar: AppBar(
          backgroundColor: levelColors[1],
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _closeAllLevels,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 180,),
                Center(
                  child: Text(
                    questions["grade2Level2"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade2Level2"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular'),),
                  );
                }),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: levelColors[0],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Помощ',
                            style: TextStyle(color: Colors.black,
                                fontStyle: FontStyle.italic, fontFamily: 'LXGWWenKaiMonoTC'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 80,),
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text('Следваща задача', style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво', style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q3SecondGradeState extends State<Q3SecondGrade> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (questions["grade2Level3"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade2Level3"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade2Level3"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade2Level3"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade2Level3"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetQuiz();
                  },
                  child: const Text('Направи отново', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }


  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Q4SecondGrade()),
    );
  }

  void _closeAllLevels() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: levelColors[2],
        appBar: AppBar(
          backgroundColor: levelColors[2],
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _closeAllLevels,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 180,),
                Center(
                  child: Text(
                    questions["grade2Level3"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade2Level3"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular'),),
                  );
                }),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: levelColors[0],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Помощ',
                            style: TextStyle(color: Colors.black,
                                fontStyle: FontStyle.italic, fontFamily: 'LXGWWenKaiMonoTC'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 80,),
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text('Следваща задача', style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво', style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q4SecondGradeState extends State<Q4SecondGrade> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (questions["grade2Level4"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade2Level4"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade2Level4"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade2Level4"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade2Level4"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetQuiz();
                  },
                  child: const Text('Направи отново', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }
  void _showHelpDialog() {
    String helpText = '';
    if (_questionIndex == 0) {
      helpText = '2 + 2 + 2...';
    } else if (_questionIndex == 1) {
      helpText = '3 + 3 + 3 + 3 + 3...';
    } else if (_questionIndex == 2) {
      helpText = '7 + 7 + 7...';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Помощ', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
          content: Text(helpText, style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Разбрах!', style: TextStyle(color:  appBarColor, fontFamily: 'LXGWWenKaiMonoTC')),
            ),
          ],
        );
      },
    );
  }


  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Q5SecondGrade()),
    );
  }

  void _closeAllLevels() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: levelColors[3],
        appBar: AppBar(
          backgroundColor: levelColors[3],
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _closeAllLevels,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 180,),
                Center(
                  child: Text(
                    questions["grade2Level4"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade2Level4"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular'),),
                  );
                }),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _showHelpDialog,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: levelColors[0],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Помощ',
                            style: TextStyle(color: Colors.black,
                                fontStyle: FontStyle.italic, fontFamily: 'LXGWWenKaiMonoTC'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 80,),
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text('Следваща задача', style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво', style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q5SecondGradeState extends State<Q5SecondGrade> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (questions["grade2Level5"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade2Level5"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade2Level5"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade2Level5"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade2Level5"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetQuiz();
                  },
                  child: const Text('Направи отново', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }
  void _showHelpDialog() {
    String helpText = '';
    if (_questionIndex == 0) {
      helpText = 'Една торта е 8 части, режеш я на 2, колко остава...';
    } else if (_questionIndex == 1) {
      helpText = 'Една торта е 10 части, режеш я на 2, колко остава...';
    } else if (_questionIndex == 2) {
      helpText = '...';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Помощ', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
          content: Text(helpText, style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Разбрах!', style: TextStyle(color:  appBarColor, fontFamily: 'LXGWWenKaiMonoTC')),
            ),
          ],
        );
      },
    );
  }


  void _closeAllLevels() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: levelColors[4],
        appBar: AppBar(
          backgroundColor: levelColors[4],
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _closeAllLevels,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 180,),
                Center(
                  child: Text(
                    questions["grade2Level5"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade2Level5"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular'),),
                  );
                }),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _showHelpDialog,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: levelColors[0],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Помощ',
                            style: TextStyle(color: Colors.black,
                                fontStyle: FontStyle.italic, fontFamily: 'LXGWWenKaiMonoTC'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 80,),
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text('Следваща задача', style: TextStyle(color:  appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
              ]),
        ));
  }
}

//QUESTIONS

class Q1SecondGrade extends StatefulWidget {
  const Q1SecondGrade({super.key});

  @override
  Q1SecondGradeState createState() => Q1SecondGradeState();
}

class Q2SecondGrade extends StatefulWidget {
  const Q2SecondGrade({super.key});

  @override
  Q2SecondGradeState createState() => Q2SecondGradeState();
}

class Q3SecondGrade extends StatefulWidget {
  const Q3SecondGrade({super.key});

  @override
  Q3SecondGradeState createState() => Q3SecondGradeState();
}

class Q4SecondGrade extends StatefulWidget {
  const Q4SecondGrade({super.key});

  @override
  Q4SecondGradeState createState() => Q4SecondGradeState();
}

class Q5SecondGrade extends StatefulWidget {
  const Q5SecondGrade({super.key});

  @override
  Q5SecondGradeState createState() => Q5SecondGradeState();
}


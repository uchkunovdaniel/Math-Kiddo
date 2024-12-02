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
      home: Q1ThirdGrade(),
    );
  }
}

class _ThirdGradeState extends State<ThirdGrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Трети клас", style: appBarTextStyle),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Image.asset('lib/images/penguinDone199.png', height: 150,), // Ensure this path is correct
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
                          MaterialPageRoute(builder: (context) => const Q1ThirdGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q2ThirdGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q3ThirdGrade()),
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
                      subtitle: Text("Натиснете тук!", style:
                      levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Q4ThirdGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q5ThirdGrade()),
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

class ThirdGrade extends StatefulWidget {
  const ThirdGrade({super.key});

  @override
  State<ThirdGrade> createState() => _ThirdGradeState();
}

//STATES

class Q1ThirdGradeState extends State<Q1ThirdGrade> {
  int _questionIndex = 0;
  int _score = 0;


  void _answerQuestion(String answer) {
    if (questions["grade3Level1"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade3Level1"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade3Level1"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade3Level1"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade3Level1"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = '32 - 4...';
    } else if (_questionIndex == 1) {
      helpText = '54 - 7...';
    } else if (_questionIndex == 2) {
      helpText = '81 - 3...';
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
              child: Text('Разбрах!', style: TextStyle(color: appBarColor, fontFamily: 'LXGWWenKaiMonoTC')),
            ),
          ],
        );
      },
    );
  }


  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Q2ThirdGrade()),
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
                    questions["grade3Level1"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade3Level1"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular'),),
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
                        child: Text('Следваща задача', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q2ThirdGradeState extends State<Q2ThirdGrade> {
  int _questionIndex = 0;
  int _score = 0;
  
  void _answerQuestion(String answer) {
    if (questions["grade3Level2"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade3Level2"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade3Level2"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade3Level2"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade3Level2"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = '24 / 4...';
    } else if (_questionIndex == 1) {
      helpText = '64 / 8...';
    } else if (_questionIndex == 2) {
      helpText = '72 / 9...';
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
              child: Text('Разбрах!', style: TextStyle(color: appBarColor, fontFamily: 'LXGWWenKaiMonoTC')),
            ),
          ],
        );
      },
    );
  }


  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Q3ThirdGrade()),
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
                    questions["grade3Level2"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade3Level2"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular'),),
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
                        child: Text('Следваща задача', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q3ThirdGradeState extends State<Q3ThirdGrade> {
  int _questionIndex = 0;
  int _score = 0;
  
  void _answerQuestion(String answer) {
    if (questions["grade3Level3"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade3Level3"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade3Level3"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade3Level3"]!.length - 1) {
        _questionIndex++;
      } else {

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade3Level3"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = 'Колко е едно денонощие...';
    } else if (_questionIndex == 1) {
      helpText = '...';
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
              child: Text('Разбрах!', style: TextStyle(color: appBarColor, fontFamily: 'LXGWWenKaiMonoTC')),
            ),
          ],
        );
      },
    );
  }


  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Q4ThirdGrade()),
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
                    questions["grade3Level3"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade3Level3"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular'),),
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
                        child: Text('Следваща задача', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q4ThirdGradeState extends State<Q4ThirdGrade> {
  int _questionIndex = 0;
  int _score = 0;
  
  void _answerQuestion(String answer) {
    if (questions["grade3Level4"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade3Level4"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade3Level4"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade3Level4"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade3Level4"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = '2 * 3 * 6...';
    } else if (_questionIndex == 1) {
      helpText = '1 cm = 10 mm...';
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
              child: Text('Разбрах!', style: TextStyle(color: appBarColor, fontFamily: 'LXGWWenKaiMonoTC')),
            ),
          ],
        );
      },
    );
  }


  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Q5ThirdGrade()),
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
                    questions["grade3Level4"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade3Level4"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular'),),
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
                        child: Text('Следваща задача', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q5ThirdGradeState extends State<Q5ThirdGrade> {
  int _questionIndex = 0;
  int _score = 0;
  
  void _answerQuestion(String answer) {
    if (questions["grade3Level5"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade3Level5"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade3Level5"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade3Level5"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade3Level5"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
                    questions["grade3Level5"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20,  fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade3Level5"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular'),),
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
                        child: Text('Следваща задача', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),
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

class Q1ThirdGrade extends StatefulWidget {
  const Q1ThirdGrade({super.key});

  @override
  Q1ThirdGradeState createState() => Q1ThirdGradeState();
}

class Q2ThirdGrade extends StatefulWidget {
  const Q2ThirdGrade({super.key});

  @override
  Q2ThirdGradeState createState() => Q2ThirdGradeState();
}

class Q3ThirdGrade extends StatefulWidget {
  const Q3ThirdGrade({super.key});

  @override
  Q3ThirdGradeState createState() => Q3ThirdGradeState();
}

class Q4ThirdGrade extends StatefulWidget {
  const Q4ThirdGrade({super.key});

  @override
  Q4ThirdGradeState createState() => Q4ThirdGradeState();
}

class Q5ThirdGrade extends StatefulWidget {
  const Q5ThirdGrade({super.key});

  @override
  Q5ThirdGradeState createState() => Q5ThirdGradeState();
}
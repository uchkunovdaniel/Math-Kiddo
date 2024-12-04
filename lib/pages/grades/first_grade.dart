import 'package:flutter/material.dart';
import 'package:mathkiddo/pages/others/home_page.dart';
import 'package:mathkiddo/pages/theme.dart';
import 'package:mathkiddo/main.dart';

//MAIN PAGE

void main() async{
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Math Quiz',
      home: FirstGrade(),
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.questionIndex,
    required this.questionText,
    required this.answers,
    required this.answerQuestion,
  });

  final int questionIndex;
  final String questionText;
  final List<String> answers;
  final Function(String) answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(questionText, style: const TextStyle(fontSize: 18)),
          ...answers.map((answer) {
            return ListTile(
              title: Text(answer),
              onTap: () => answerQuestion(answer),
            );
          }),
        ],
      ),
    );
  }
}

class _FirstGradeState extends State<FirstGrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Първи клас", style: appBarTextStyle),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Image.asset('lib/images/bunnyForApp91.png', height: 150,), // Ensure this path is correct
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
                          MaterialPageRoute(builder: (context) => const Q1FirstGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q2FirstGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q3FirstGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q4FirstGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q5FirstGrade()),
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

class FirstGrade extends StatefulWidget {
  const FirstGrade({super.key});
  @override
  State<FirstGrade> createState() => _FirstGradeState();
}

//STATES

class Q1FirstGradeState extends State<Q1FirstGrade> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (questions['grade1Level1']![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade1Level1"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade1Level1"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade1Level1"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular'),),
              content: Text('Резултат: $_score / ${questions["grade1Level1"]!.length}',style: const TextStyle(fontFamily: 'RobotoSlab-Regular'),),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetQuiz();
                  },
                  child: const Text('Направи отново', style: TextStyle(fontFamily: 'RobotoSlab-Regular'),),
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
      helpText = 'Едно пръстче и още двечки...';
    } else if (_questionIndex == 1) {
      helpText = 'Четири пръстчета и още три...';
    } else if (_questionIndex == 2) {
      helpText = 'Шест пръстчета и още четири...';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Помощ', style: TextStyle(fontFamily: 'RobotoSlab-Regular'),),
          content: Text(helpText, style: const TextStyle(fontFamily: 'RobotoSlab-Regular'),),
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
      MaterialPageRoute(builder: (context) => const Q2FirstGrade()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: levelColors[0],
        appBar: AppBar(
          backgroundColor: levelColors[0],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 180,),
                Center(
                  child: Text(
                    questions["grade1Level1"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade1Level1"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

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

class Q2FirstGradeState extends State<Q2FirstGrade> {
  int _questionIndex = 0;
  int _score = 0;


  void _answerQuestion(String answer) {
    if (questions["grade1Level2"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade1Level2"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade1Level2"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade1Level2"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade1Level2"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = 'Пет пръстчета и свали две...';
    } else if (_questionIndex == 1) {
      helpText = 'Девет пръстчета и свали седем...';
    } else if (_questionIndex == 2) {
      helpText = 'Две пръстчета и ги свали...';
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
      MaterialPageRoute(builder: (context) => const Q3FirstGrade()),
    );
  }

  void _closeAllLevels() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
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
                    questions["grade1Level2"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade1Level2"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

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

class Q3FirstGradeState extends State<Q3FirstGrade> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (questions["grade1Level3"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade1Level3"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade1Level3"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade1Level3"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade1Level3"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = 'Вземи 10 пръчици за смятане, добави още 1 и ги преброй...';
    } else if (_questionIndex == 1) {
      helpText = 'Вземи 9 пръчици за смятане и още 7, колко стават...';
    } else if (_questionIndex == 2) {
      helpText = 'Вземи 12 пръчици за смятане, добави още 6 и ги преброй...';
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
      MaterialPageRoute(builder: (context) => const Q3FirstGrade()),
    );
  }

  void _closeAllLevels() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
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
                    questions["grade1Level3"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade1Level3"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

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

class Q4FirstGradeState extends State<Q4FirstGrade> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (questions["grade1Level4"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade1Level4"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade1Level4"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade1Level4"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade1Level4"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
    String helpText = ''; // Initialize with an empty string
    if (_questionIndex == 0) {
      helpText = 'Вземи 13 пръчици за смятане и от тях премахни 11. Колко са останалите...';
    } else if (_questionIndex == 1) {
      helpText = 'Вземи 15 пръчици за смятяне, след което премахни 4 и останалите са...';
    } else if (_questionIndex == 2) {
      helpText = 'Вземи 12 пръчици за смятане, махни 8 и останалите пръчици са...';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Помощ',style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
          content: Text(helpText, style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Разбрах!', style: TextStyle(color: appBarColor, fontFamily: 'LXGWWenKaiMonoTC'),),
            ),
          ],
        );
      },
    );
  }

  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Q5FirstGrade()),
    );
  }

  void _closeAllLevels() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
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
                    questions["grade1Level4"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade1Level4"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

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
                        child: Text('Следваща задача',
                            style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво',
                      style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q5FirstGradeState extends State<Q5FirstGrade> {
  int _questionIndex = 0;
  int _score = 0;

  void _answerQuestion(String answer) {
    if (questions["grade1Level5"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade1Level5"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade1Level5"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade1Level5"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular'),),
              content: Text('Резултат: $_score / ${questions["grade1Level5"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular'),),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetQuiz();
                  },
                  child: const Text('Направи отново', style: TextStyle(fontFamily: 'RobotoSlab-Regular'),),
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
      helpText = 'Вземи 20 пръчици и махни 3, колко остават...';
    } else if (_questionIndex == 1) {
      helpText = 'Вземи 15 пръчици и добави 5, полученият отговор е...';
    } else if (_questionIndex == 2) {
      helpText = 'Започни да броиш от 1 до 20...';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Помощ',
            style: TextStyle(fontFamily: 'RobotoSlab-Regular'),),
          content: Text(helpText, style: const TextStyle(fontFamily: 'RobotoSlab-Regular'),),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Разбрах!',
                  style: TextStyle(color: appBarColor,
                      fontFamily: 'LXGWWenKaiMonoTC')),
            ),
          ],
        );
      },
    );
  }

  void _closeAllLevels() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
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
                    questions["grade1Level5"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade1Level5"]![_questionIndex]['answers'] as List<dynamic>).map((answer)


                {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(answer, style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),
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
                        child: Text('Следваща задача',
                          style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular'),),
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

class Q1FirstGrade extends StatefulWidget {
  const Q1FirstGrade({super.key});

  @override
  Q1FirstGradeState createState() => Q1FirstGradeState();
}

class Q2FirstGrade extends StatefulWidget {
  const Q2FirstGrade({super.key});

  @override
  Q2FirstGradeState createState() => Q2FirstGradeState();
}

class Q3FirstGrade extends StatefulWidget {
  const Q3FirstGrade({super.key});

  @override
  Q3FirstGradeState createState() => Q3FirstGradeState();
}

class Q4FirstGrade extends StatefulWidget {
  const Q4FirstGrade({super.key});

  @override
  Q4FirstGradeState createState() => Q4FirstGradeState();
}

class Q5FirstGrade extends StatefulWidget {
  const Q5FirstGrade({super.key});

  @override
  Q5FirstGradeState createState() => Q5FirstGradeState();
}
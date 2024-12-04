import 'package:flutter/material.dart';
import 'package:mathkiddo/pages/theme.dart';
import 'package:mathkiddo/main.dart';
import 'package:mathkiddo/pages/others/home_page.dart';

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
      home: Q1FourthGrade(),
    );
  }
}

class _FourthGradeState extends State<FourthGrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Четвърти клас", style: appBarTextStyle),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Image.asset('lib/images/turtleDoneF.png', height: 150,), // Ensure this path is correct
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
                          MaterialPageRoute(builder: (context) => const Q1FourthGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q2FourthGrade()),
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
                      subtitle: Text("Натиснете тук!", style:
                      levelSubtitleTextStyle),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Q3FourthGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q4FourthGrade()),
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
                          MaterialPageRoute(builder: (context) => const Q5FourthGrade()),
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

class FourthGrade extends StatefulWidget {
  const FourthGrade({super.key});

  @override
  State<FourthGrade> createState() => _FourthGradeState();
}

//STATES

class Q1FourthGradeState extends State<Q1FourthGrade> {
  int _questionIndex = 0;
  int _score = 0;
  
  void _answerQuestion(String answer) {
    if (questions["grade4Level1"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade4Level1"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade4Level1"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade4Level1"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade4Level1"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      MaterialPageRoute(builder: (context) => const Q2FourthGrade()),
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
                    questions["grade4Level1"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade4Level1"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

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
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво', style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q2FourthGradeState extends State<Q2FourthGrade> {
  int _questionIndex = 0;
  int _score = 0;
  
  void _answerQuestion(String answer) {
    if (questions["grade4Level2"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade4Level2"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade4Level2"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade4Level2"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade4Level2"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = 'Първо умножението...';
    } else if (_questionIndex == 1) {
      helpText = 'Първо делението...';
    } else if (_questionIndex == 2) {
      helpText = 'Първо умножението...';
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
      MaterialPageRoute(builder: (context) => const Q3FourthGrade()),
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
                    questions["grade4Level2"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade4Level2"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

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

class Q3FourthGradeState extends State<Q3FourthGrade> {
  int _questionIndex = 0;
  int _score = 0;
  
  void _answerQuestion(String answer) {
    if (questions["grade4Level3"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade4Level3"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade4Level3"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade4Level3"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade4Level3"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = '...';
    } else if (_questionIndex == 1) {
      helpText = '...';
    } else if (_questionIndex == 2) {
      helpText = '10 000 - 2865...';
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
      MaterialPageRoute(builder: (context) => const Q4FourthGrade()),
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
                    questions["grade4Level3"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade4Level3"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

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

class Q4FourthGradeState extends State<Q4FourthGrade> {
  int _questionIndex = 0;
  int _score = 0;
  
  void _answerQuestion(String answer) {
    if (questions["grade4Level4"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade4Level4"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade4Level4"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade4Level4"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade4Level4"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = 'Първо умножението...';
    } else if (_questionIndex == 1) {
      helpText = '3281 + 249...';
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
      MaterialPageRoute(builder: (context) => const Q5FourthGrade()),
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
                    questions["grade4Level4"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade4Level4"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

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
                        child: Text('Следваща задача',  style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),
                      ),
                    ],
                  ),
                  ],
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  child: Text('Следващо ниво',  style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),)
              ]),
        ));
  }
}

class Q5FourthGradeState extends State<Q5FourthGrade> {
  int _questionIndex = 0;
  int _score = 0;
  
  void _answerQuestion(String answer) {
    if (questions["grade4Level5"]![_questionIndex]['correctAnswer'] == answer) {
      setState(() {
        _score++;
        if(progressdict["Grade4Level5"]!["Question${_questionIndex+1}"] == false){
          progress++;
          progressdict["Grade4Level5"]!["Question${_questionIndex+1}"] = true;
        }
        const Icon(Icons.done);
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_questionIndex < questions["grade4Level5"]!.length - 1) {
        _questionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Завършено!', style: TextStyle(fontFamily: 'RobotoSlab-Regular')),
              content: Text('Резултат: $_score / ${questions["grade4Level5"]!.length}', style: const TextStyle(fontFamily: 'RobotoSlab-Regular')),
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
      helpText = 'Първо събери...';
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
                    questions["grade4Level5"]![_questionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 20, fontFamily: 'RobotoSlab-Regular'),
                  ),
                ),

                const SizedBox(height: 30),
                ...(questions["grade4Level5"]![_questionIndex]['answers'] as List<dynamic>).map((answer)

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
                        child: Text('Следваща задача',  style: TextStyle(color: appBarColor, fontFamily: 'RobotoSlab-Regular')),
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

class Q1FourthGrade extends StatefulWidget {
  const Q1FourthGrade({super.key});

  @override
  Q1FourthGradeState createState() => Q1FourthGradeState();
}

class Q2FourthGrade extends StatefulWidget {
  const Q2FourthGrade({super.key});

  @override
  Q2FourthGradeState createState() => Q2FourthGradeState();
}

class Q3FourthGrade extends StatefulWidget {
  const Q3FourthGrade({super.key});

  @override
  Q3FourthGradeState createState() => Q3FourthGradeState();
}

class Q4FourthGrade extends StatefulWidget {
  const Q4FourthGrade({super.key});

  @override
  Q4FourthGradeState createState() => Q4FourthGradeState();
}

class Q5FourthGrade extends StatefulWidget {
  const Q5FourthGrade({super.key});

  @override
  Q5FourthGradeState createState() => Q5FourthGradeState();
}

import 'package:cloud_firestore/cloud_firestore.dart';
//GRADE 1
final firestoreInstance = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getDataFirestore(String collectionName) async {
  QuerySnapshot querySnapshot = await firestoreInstance.collection(collectionName).get();
  return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
}

Future<Map<String, List<Map<String, dynamic>>>> getAllQuestions() async {
  Map<String, List<Map<String, dynamic>>> questions = {};
  for (int i = 1; i <= 4; i++) {
    for (int j = 1; j <= 5; j++) {
      List<Map<String, dynamic>> data = await getDataFirestore("Grade${i}Level$j");
      questions["grade${i}Level$j"] = data;
    }
  }
  return questions;
}

//
// final List<Map<String, Object>> grade1Level1 = [
// {
// "questionText": "Колко е 1 + 2?",
// "answers": ["3", "4", "2", "6"],
// "correctAnswer": "3"
// },
// {
// "questionText": "Колко е 4 + 3?",
// "answers": ["8", "5", "7", "10"],
// "correctAnswer": "7"
// },
// {
// "questionText": "Колко е 6 + 4?",
// "answers": ["10", "8", "6", "4"],
// "correctAnswer": "10"
// }
// ];
//
// final List<Map<String, Object>> grade1Level2 = [
//   {
//     'questionText': 'Колко е 5 - 2?',
//     'answers': ['3', '4', '2', '6'],
//     'correctAnswer': '3',
//   },
//   {
//     'questionText': 'Колко е 9 - 7?',
//     'answers': ['8', '5', '2', '4'],
//     'correctAnswer': '2',
//   },
//   {
//     'questionText': 'Колко е 2 - 2?',
//     'answers': ['10', '0', '2', '1'],
//     'correctAnswer': '0',
//   },
// ];
//
// final List<Map<String, Object>> grade1Level3 = [
//   {
//     'questionText': 'Колко е 10 + 1?',
//     'answers': ['3', '2', '11', '9'],
//     'correctAnswer': '11',
//   },
//   {
//     'questionText': 'Колко е 9 + 7?',
//     'answers': ['10', '2', '16', '17'],
//     'correctAnswer': '16',
//   },
//   {
//     'questionText': 'Колко е 12 + 6?',
//     'answers': ['10', '6', '18', '1'],
//     'correctAnswer': '18',
//   },
// ];
//
// final List<Map<String, Object>> grade1Level4 = [
//   {
//     'questionText': 'Колко е 13 - 11?',
//     'answers': ['3', '2', '11', '24'],
//     'correctAnswer': '2',
//   },
//   {
//     'questionText': 'Колко е 15 - 4?',
//     'answers': ['19', '2', '11', '17'],
//     'correctAnswer': '11',
//   },
//   {
//     'questionText': 'Колко е 12 - 8?',
//     'answers': ['20', '10', '4', '1'],
//     'correctAnswer': '4',
//   },
// ];
//
// final List<Map<String, Object>> grade1Level5 = [
//   {
//     'questionText': 'Колко е 20 - 3?',
//     'answers': ['17', '2', '7', '9'],
//     'correctAnswer': '17',
//   },
//   {
//     'questionText': 'Колко е 15 + 5?',
//     'answers': ['10', '2', '16', '20'],
//     'correctAnswer': '20',
//   },
//   {
//     'questionText': 'Коe число е двадесет?',
//     'answers': ['12', '2', '20', '1'],
//     'correctAnswer': '20',
//   },
// ];
//
// //GRADE 2
//
// final List<Map<String, Object>> grade2Level1 = [
//   {
//     'questionText': 'Колко cm са 10dm?',
//     'answers': ['1', '10', '100', '11'],
//     'correctAnswer': '100',
//   },
//   {
//     'questionText': 'Колко dm е 1m?',
//     'answers': ['100', '1', '2', '10'],
//     'correctAnswer': '10',
//   },
//   {
//     'questionText': 'Колко cm са 3dm + 1cm?',
//     'answers': ['4', '31', '2', '100'],
//     'correctAnswer': '31',
//   },
// ];
//
// final List<Map<String, Object>> grade2Level2 = [
//   {
//     'questionText': 'Колко е 41 + 3?',
//     'answers': ['3', '44', '10', '40'],
//     'correctAnswer': '44',
//   },
//   {
//     'questionText': 'Колко е 52 + 6?',
//     'answers': ['60', '46', '2', '58'],
//     'correctAnswer': '60',
//   },
//   {
//     'questionText': 'Колко е 33 + 4?',
//     'answers': ['10', '37', '30', '29'],
//     'correctAnswer': '37',
//   },
// ];
//
// final List<Map<String, Object>> grade2Level3 = [
//   {
//     'questionText': 'Колко е 57 - 2?',
//     'answers': ['5', '55', '59', '60'],
//     'correctAnswer': '55',
//   },
//   {
//     'questionText': 'Колко е 29 - 5?',
//     'answers': ['30', '34', '14', '15'],
//     'correctAnswer': '14',
//   },
//   {
//     'questionText': 'Колко е 83 - 2?',
//     'answers': ['85', '81', '80', '1'],
//     'correctAnswer': '81',
//   },
// ];
//
// final List<Map<String, Object>> grade2Level4 = [
//   {
//     'questionText': 'Колко е 2 * 3?',
//     'answers': ['3', '2', '8', '6'],
//     'correctAnswer': '6',
//   },
//   {
//     'questionText': 'Колко е 3 * 5?',
//     'answers': ['10', '5', '15', '3'],
//     'correctAnswer': '15',
//   },
//   {
//     'questionText': 'Колко е 3 * 7?',
//     'answers': ['28', '3', '7', '21'],
//     'correctAnswer': '21',
//   },
// ];
//
// final List<Map<String, Object>> grade2Level5 = [
//   {
//     'questionText': 'Колко е 8 / 2?',
//     'answers': ['8', '4', '2', '6'],
//     'correctAnswer': '4',
//   },
//   {
//     'questionText': 'Колко е 10 / 2?',
//     'answers': ['8', '5', '2', '10'],
//     'correctAnswer': '5',
//   },
//   {
//     'questionText': 'Колко е 2 / 2?',
//     'answers': ['10', '0', '2', '1'],
//     'correctAnswer': '1',
//   },
// ];
//
// //GRADE 3
//
//   final List<Map<String, Object>> grade3Level1 = [
//     {
//       'questionText': 'Намерете ?  4 + ? = 32',
//       'answers': ['27', '30', '28', '36'],
//       'correctAnswer': '28',
//     },
//     {
//       'questionText': 'Намерете ?  54 = ? + 7',
//       'answers': ['60', '46', '61', '47'],
//       'correctAnswer': '47',
//     },
//     {
//       'questionText': 'Намерете ?  3 + ? = 81',
//       'answers': ['78', '84', '75', '80'],
//       'correctAnswer': '78',
//     },
//   ];
//
// final List<Map<String, Object>> grade3Level2 = [
//   {
//     'questionText': 'Намерете ?  4 * ? = 24',
//     'answers': ['6', '1', '24', '40'],
//     'correctAnswer': '6',
//   },
//   {
//     'questionText': 'Намерете ?  64 = ? * 8',
//     'answers': ['60', '8', '1', '58'],
//     'correctAnswer': '8',
//   },
//   {
//     'questionText': 'Намерете ?  72 = ? * 9',
//     'answers': ['10', '72', '8', '1'],
//     'correctAnswer': '8',
//   },
// ];
//
// final List<Map<String, Object>> grade3Level3 = [
//   {
//     'questionText': '2 денонощия = ? ча̀са',
//     'answers': ['24', '12', '48', '32'],
//     'correctAnswer': '48',
//   },
//   {
//     'questionText': 'Намерете ?   744, ?, 746',
//     'answers': ['747', '745', '743', '10'],
//     'correctAnswer': '745',
//   },
//   {
//     'questionText': 'Намерете ?  380 = ? стотици + ? десетици + ? единици',
//     'answers': ['0, 3, 8', '3, 8, 0', '8, 3, 0', '1, 3, 8'],
//     'correctAnswer': '3, 8, 0',
//   },
// ];
//
// final List<Map<String, Object>> grade3Level4 = [
//   {
//     'questionText': 'Блокът на Виолет има 2 входа и 6 етажа. На всеки етаж има по 3 апартамента. Колко са всички апартаменти в блока? ',
//     'answers': ['3', '2', '36', '6'],
//     'correctAnswer': '36',
//   },
//   {
//     'questionText': '3cm = ? mm',
//     'answers': ['30', '3', '1', '100'],
//     'correctAnswer': '30',
//   },
//   {
//     'questionText': 'Колко е 835 - 128?',
//     'answers': ['913', '700', '707', '800'],
//     'correctAnswer': '707',
//   },
// ];
//
// final List<Map<String, Object>> grade3Level5 = [
//   {
//     'questionText': 'Колко е 36 * 2?',
//     'answers': ['80', '10', '72', '36'],
//     'correctAnswer': '72',
//   },
//   {
//     'questionText': 'Колко е 4 * 217?',
//     'answers': ['868', '500', '217', '900'],
//     'correctAnswer': '868',
//   },
//   {
//     'questionText': 'Колко е 89 * 0?',
//     'answers': ['10', '0', '89', '100'],
//     'correctAnswer': '0',
//   },
// ];
//
// //GRADE 4
//
// final List<Map<String, Object>> grade4Level1 = [
//   {
//     'questionText': 'Колко е 4000 + 4000?',
//     'answers': ['4000', '80', '8000', '800'],
//     'correctAnswer': '8000',
//   },
//   {
//     'questionText': 'Колко е 500 + 5000?',
//     'answers': ['550', '5050', '5000', '5500'],
//     'correctAnswer': '5500',
//   },
//   {
//     'questionText': 'Колко е 50 000 + 1000',
//     'answers': ['51 000', '510', '50010', '1000'],
//     'correctAnswer': '51 000',
//   },
// ];
//
// final List<Map<String, Object>> grade4Level2 = [
//   {
//     'questionText': 'Колко е 123 051 + 4 * 237 ?',
//     'answers': ['29 164 035', '123 999', '130 000', '948'],
//     'correctAnswer': '123 999',
//   },
//   {
//     'questionText': 'Колко е 984 / 3 + 130 071 ?',
//     'answers': ['0', '1440 000', '100 000', '130 399'],
//     'correctAnswer': '130 399',
//   },
//   {
//     'questionText': 'Колко е 55 * 3 + 932 412?',
//     'answers': ['935 577', '720 568', '1 000 000', '51 282 825'],
//     'correctAnswer': '935 577',
//   },
// ];
//
// final List<Map<String, Object>> grade4Level3 = [
//   {
//     'questionText': 'Колко е 2 * 1000?',
//     'answers': ['20', '200', '1000', '2000'],
//     'correctAnswer': '2000',
//   },
//   {
//     'questionText': 'Колко е 468 / 2?',
//     'answers': ['1', '234', '200', '243'],
//     'correctAnswer': '234',
//   },
//   {
//     'questionText': 'Намерете ?  2865 + ? = 10 000',
//     'answers': ['10 000', '8 000', '7 100', '7 135'],
//     'correctAnswer': '7 135',
//   },
// ];
//
// final List<Map<String, Object>> grade4Level4 = [
//   {
//     'questionText': 'Колко е 8 . 111 - 6 . 111?',
//     'answers': ['2', '222', '111', '666'],
//     'correctAnswer': '222',
//   },
//   {
//     'questionText': 'Намери ?  ? - 249 = 3281',
//     'answers': ['3000', '3032', '249', '3281'],
//     'correctAnswer': '3032',
//   },
//   {
//     'questionText': 'Колко е произведението на числата 168 и 24?',
//     'answers': ['4,320', '432', '4032', '4000'],
//     'correctAnswer': '4032',
//   },
// ];
//
// final List<Map<String, Object>> grade4Level5 = [
//   {
//     'questionText': 'Намери x:\n  x / 9 = 460 + 44?',
//     'answers': ['9', '44', '504', '56'],
//     'correctAnswer': '4536',
//   },
//   {
//     'questionText': 'Колко е 11 * 900 - 900?',
//     'answers': ['111', '9 000', '9 9000', '900'],
//     'correctAnswer': '9 000',
//   },
//   {
//     'questionText': 'Множители са 54 и 313, а произведението е...',
//     'answers': ['10 000', '16 570', '5 000', '16 902'],
//     'correctAnswer': '16 902',
//   },
// ];
//

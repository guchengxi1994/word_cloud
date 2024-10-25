import 'package:flutter/material.dart';
import 'package:word_cloud/tools.dart';
import 'package:word_cloud/word_cloud.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WordCloud(words: data),
      ),
    );
  }
}

List<Map<String, dynamic>> data = [
  {"text": '螺蛳粉', "fontSize": 40, "color": colorToHex(Colors.red)},
  {"text": '重庆小面', "fontSize": 35, "color": colorToHex(Colors.blue)},
  {"text": '肉夹馍', "fontSize": 35, "color": colorToHex(Colors.blue)},
  {"text": '炸酱面', "fontSize": 32, "color": colorToHex(Colors.blue)},
  {"text": '沙县小吃', "fontSize": 25, "color": colorToHex(Colors.yellow)},
  {"text": '烤冷面', "fontSize": 23, "color": colorToHex(Colors.yellow)},
  {"text": '臭豆腐', "fontSize": 23, "color": colorToHex(Colors.yellow)},
  {"text": '钵钵鸡', "fontSize": 20, "color": colorToHex(Colors.orange)},
  {"text": '酸辣粉', "fontSize": 19, "color": colorToHex(Colors.green)},
  {"text": '冒菜', "fontSize": 15, "color": colorToHex(Colors.greenAccent)},
  {"text": '驴打滚', "fontSize": 12, "color": colorToHex(Colors.greenAccent)},
  {"text": '板栗', "fontSize": 11, "color": colorToHex(Colors.grey)},
  {"text": '醪糟', "fontSize": 10, "color": colorToHex(Colors.pink)}
];

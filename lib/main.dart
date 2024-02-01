import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS Quado',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  List<String> students = ['Voldi', 'Anderson', 'Divin', 'David', 'Michel'];
  List<Color> colors = [Colors.white, Colors.blue, Colors.red, Colors.yellow, Colors.red];
  int index = 1;

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: students.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            myContainer('$index', colors[index]),
          ],
        );
      }
    );
  }
  
  Container myContainer(String text, Color color){
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color
      ),
      child: Text(text),
    );
  }
}


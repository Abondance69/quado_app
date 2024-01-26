import 'package:flutter/material.dart';

class CleaningPage extends StatefulWidget {
  const CleaningPage({super.key});

  @override
  CleaningPageState createState() => CleaningPageState();
}

class CleaningPageState extends State<CleaningPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page de cleaning'),
      ),
    );
  }
}

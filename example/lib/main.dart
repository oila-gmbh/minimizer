import 'package:flutter/material.dart';
import 'package:minimizer/minimizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Column(
            children: [
              Text('Running'),
              OutlinedButton(
                onPressed: Minimizer.toPreviousApp,
                child: Text('to previous app'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

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
  final List<String> petPicturesUriList = ['lib/img/dog.jpeg', 'lib/img/cat.jpg', 'lib/img/orca.jpg'];
  String petPicturesUri = "lib/img/dog.jpeg";
  final Random random = Random();

  void _changePetPicture() {
    setState(() {
      final int randomIndexInt = random.nextInt(3);
      petPicturesUri = petPicturesUriList[randomIndexInt];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Digital Pet App',
            ),
            Text(
              'Pet Picture',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset(
              petPicturesUri,
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changePetPicture,
        tooltip: 'Change Pet Picture',
        child: const Icon(Icons.image),
      ),
    );
  }
}

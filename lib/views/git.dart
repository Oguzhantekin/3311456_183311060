import 'package:flutter/material.dart';


class GitScreen extends StatelessWidget {
  const GitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world project',
      home: Scaffold(
        appBar: AppBar(title: const Text('About')),
        body: Center(
          child:
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('git linkleri:'),
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, 'home_screen');
                },
                    child: Text("Ana Sayfaya Dön"))
              ]
          ),
        ),
      ),
    );
  }
}
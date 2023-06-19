import 'package:flutter/material.dart';
import '../widgets/rounded_button.dart';

class Groceries extends StatefulWidget {
  const Groceries({Key? key}) : super(key: key);

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RoundedButton(
              colour: Colors.deepPurple,
              title: 'Meditation',
              onPressed: () {
                Navigator.pushNamed(context, 'meditation_screen');
              },
            ),
            RoundedButton(
                colour: Colors.green,
                title: 'Habit Tracker',
                onPressed: () {
                 Navigator.pushNamed(context, 'habit_screen');
                }),
            RoundedButton(
                colour: Colors.green,
                title: 'Path Provider Example',
                onPressed: () {
                  Navigator.pushNamed(context, 'path_example');
                }),
          ]),
    );
  }
}

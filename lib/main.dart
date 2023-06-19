import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/views/chat.dart';
import 'firebase_options.dart';
import 'package:todo_app/views/settings.dart';
import 'views/home.dart';
import 'views/welcome_screen.dart';
import 'views/signup_screen.dart';
import 'views/login_screen.dart';
import 'views/about.dart';
import 'views/git.dart';
import 'views/meditation_screen.dart.';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/src/material/colors.dart';
import "views/habit_screen.dart";
import 'views/path_provider.dart';

Future main() async {

  await Hive.initFlutter();

  await Hive.openBox("Habit_Database");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);
  final String temp = "empty";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
    ),
        home:const WelcomeScreen(),
        routes: {
        'welcome_screen': (context) => const WelcomeScreen(),
        'registration_screen': (context) => const  RegistrationScreen(),
        'login_screen': (context) => const LoginScreen(),
        'home_screen': (context) => const HomeScreen(),
          'settings':(context) => const SettingsScreen(),
          'about':(context) => const AboutScreen(),
          'git_screen':(context) => const GitScreen(),
          'chat_screen':(context) =>  ChatScreen(taskName: temp),
          'meditation_screen':(context) => const Meditation(),
         'habit_screen':(context) => const HabitScreen(),
          'path_example':(context) => const PathProv(title: "Path Provider"),
        },
    );
  }
}


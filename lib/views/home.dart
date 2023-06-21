import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/add_task_dialog.dart';
import 'tasks.dart';
import 'categories.dart';
import "habit_screen.dart";
import 'meditation_screen.dart.';
import 'path_provider.dart';
import '/widgets/my_alert_box.dart';
import 'package:todo_app/data/habit_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;
  bool visible = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Better Days"),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'settings');
            },
            icon: const Icon(CupertinoIcons.settings),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: visible,
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddTaskAlertDialog();
                },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                pageController.jumpToPage(index);
                if (_selectedIndex == 0) {
                  visible = true;
                } else if (_selectedIndex != 0) {
                  visible = false;
                }
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_list),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.tag),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.hammer),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.memories),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          Center(
            child: Tasks(),
          ),
          Center(
            child: Meditation(),
          ),
          Center(
            child: HabitScreen(),
          ),
          Center(
            child: PathProv(title: "Path Provider Example"),
          ),
        ],
      ),
    );
  }
}

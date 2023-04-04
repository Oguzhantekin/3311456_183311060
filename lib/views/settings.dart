import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextStyle headingStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red);

  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool changePassSwitchVal = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.redAccent,
          secondary: Colors.redAccent,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Settings UI"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Common",
                      style: headingStyle,
                    ),
                  ],
                ),
                const ListTile(
                  leading: Icon(Icons.language),
                  title: Text("Language"),
                  subtitle: Text("English"),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.cloud),
                  title: Text("Environment"),
                  subtitle: Text("Production"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Account", style: headingStyle),
                  ],
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('Email çekilemedi!'),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Sign Out"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'welcome_screen');
                          },
                          icon: const Icon(Icons.logout)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Security", style: headingStyle),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.phonelink_lock_outlined),
                  title: const Text("Lock app in background"),
                  trailing: Switch(
                      value: lockAppSwitchVal,
                      activeColor: Colors.redAccent,
                      onChanged: (val) {
                        setState(() {
                          lockAppSwitchVal = val;
                        });
                      }),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.fingerprint),
                  title: const Text("Use fingerprint"),
                  trailing: Switch(
                      value: fingerprintSwitchVal,
                      activeColor: Colors.redAccent,
                      onChanged: (val) {
                        setState(() {
                          fingerprintSwitchVal = val;
                        });
                      }),
                ),
                const Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Misc", style: headingStyle),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.file_open_outlined),
                  title: const Text("About"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'about');
                          },
                          icon: const Icon(Icons.navigation)),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.file_copy_outlined),
                  title: Text("Open Source and Licences"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'git_screen');
                          },
                          icon: const Icon(Icons.navigation)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}
import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

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
                  Text('Bu Proje Selçuk Üniversitesi Teknoloji Fakültesi ikinci sınıf dersi olan Mobil Uygulama dersi için yapılmıştır.'),
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
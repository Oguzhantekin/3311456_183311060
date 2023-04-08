import 'package:flutter/material.dart';
import '../views/chat.dart';

class ChatGPTDialog extends StatefulWidget {
  late String taskName;

  ChatGPTDialog({Key? key, required this.taskName}) : super(key: key);

  @override
  State<ChatGPTDialog> createState() => _ChatGPTDialogState();
}

class _ChatGPTDialogState extends State<ChatGPTDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text(
        'Get Advice',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.brown),
      ),
      content: SizedBox(
        child: Form(
          child: Column(
            children: <Widget>[
              const Text(
                'Do you wanna get a advice for your task?',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {

            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(taskName: widget.taskName)));
            Navigator.popAndPushNamed(context, 'chat_screen',arguments: {'taskName' : widget.taskName});
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
          ),
          child: const Text('Get Advice'),
        ),
      ],
    );
  }
}

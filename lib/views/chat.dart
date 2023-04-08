import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

//String askGPT(askAboutTask) {
//  final openAI = OpenAI.instance.build(token: "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",baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)));

//  late final request = CompleteText(prompt: askAboutTask, model: Model.TextDavinci3, maxTokens: 200);
// return request.toString();
//}

late String text ;
Future<String> generateText(String taskName) async {
  late String prompt = "How can i do  $taskName  in most efficient way?";
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': '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',
    },
    body: jsonEncode({
      'prompt': prompt,
      'max_tokens': 200,
      'temperature': 0.5,
      'n': 1,
      'stop': '\n',
    }),
  );

  if (response.statusCode == 200) {
    //setState(){};
    final data = jsonDecode(response.body);
    return (data['choices'][0]['text']).toString();
  } else {
    throw Exception('Failed to generate text');
  }
}


class ChatScreen extends StatefulWidget {
  String  taskName = "";

   ChatScreen({super.key, required this.taskName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState  extends State<ChatScreen>  {
  //final text = await generateText('Hello, ');
  //final String value = widget.taskName;
  //final String responseFromGPT = generateText(widget.taskName).toString();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title:"There is no title",
      home: Scaffold(
          appBar: AppBar(title: const Text('About')),
          body: Center(
            child:
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Text(generateText(widget.taskName).toString()),
            FutureBuilder<String>(
            future: generateText(widget.taskName),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  setState(() {});
                  return Text(snapshot.data!);
                } else {
                  return CircularProgressIndicator();
                }
              }
            ),
                ]
            ),
          ),
        ),
    );
  }
}
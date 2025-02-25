import 'package:flutter/material.dart';

class doc_message extends StatefulWidget {
  const doc_message({super.key});

  @override
  State<doc_message> createState() => _doc_messageState();
}

class _doc_messageState extends State<doc_message> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: doc_chat(),
      ),
    );
  }
}

class doc_chat extends StatefulWidget {
  const doc_chat({super.key});

  @override
  State<doc_chat> createState() => _doc_chatState();
}

class _doc_chatState extends State<doc_chat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("doc message page"),
      ),
    );
  }
}

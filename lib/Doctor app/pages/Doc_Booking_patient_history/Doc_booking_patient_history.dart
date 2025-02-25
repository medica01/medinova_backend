import 'package:flutter/material.dart';

class doc_book_pati extends StatefulWidget {
  const doc_book_pati({super.key});

  @override
  State<doc_book_pati> createState() => _doc_book_patiState();
}

class _doc_book_patiState extends State<doc_book_pati> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Doc_see_user(),
      ),
    );
  }
}

class Doc_see_user extends StatefulWidget {
  const Doc_see_user({super.key});

  @override
  State<Doc_see_user> createState() => _Doc_see_userState();
}

class _Doc_see_userState extends State<Doc_see_user> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Doc booking user page"),
      ),
    );
  }
}

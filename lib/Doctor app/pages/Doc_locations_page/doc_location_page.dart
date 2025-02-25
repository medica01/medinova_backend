import 'package:flutter/material.dart';


class doc_location extends StatefulWidget {
  const doc_location({super.key});

  @override
  State<doc_location> createState() => _doc_locationState();
}

class _doc_locationState extends State<doc_location> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: doc_loc(),
      ),
    );
  }
}

class doc_loc extends StatefulWidget {
  const doc_loc({super.key});

  @override
  State<doc_loc> createState() => _doc_locState();
}

class _doc_locState extends State<doc_loc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("doc locations page"),
      ),
    );
  }
}


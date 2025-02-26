import 'package:flutter/material.dart';

class doc_details_col extends StatefulWidget {
  const doc_details_col({super.key});

  @override
  State<doc_details_col> createState() => _doc_details_colState();
}

class _doc_details_colState extends State<doc_details_col> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: doc_det_collect(),
      ),
    );
  }
}

class doc_det_collect extends StatefulWidget {
  const doc_det_collect({super.key});

  @override
  State<doc_det_collect> createState() => _doc_det_collectState();
}

class _doc_det_collectState extends State<doc_det_collect> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


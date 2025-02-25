import 'package:flutter/material.dart';

class doc_profiles extends StatefulWidget {
  const doc_profiles({super.key});

  @override
  State<doc_profiles> createState() => _doc_profilesState();
}

class _doc_profilesState extends State<doc_profiles> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: doc_profile_page(),
      ),
    );
  }
}

class doc_profile_page extends StatefulWidget {
  const doc_profile_page({super.key});

  @override
  State<doc_profile_page> createState() => _doc_profile_pageState();
}

class _doc_profile_pageState extends State<doc_profile_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("doc profile page"),
      ),
    );
  }
}

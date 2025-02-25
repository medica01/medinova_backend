import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class photo extends StatefulWidget {
  const photo({super.key});

  @override
  State<photo> createState() => _photoState();
}

class _photoState extends State<photo> {
  File? img;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showimg();
  }

  Future<void> _showimg() async {
    SharedPreferences perr = await SharedPreferences.getInstance();
    String? showimag = perr.getString("image_path");
    setState(() {
      img = File(showimag!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: img != null
              ? Image.file(fit: BoxFit.cover, img!)
              : Image.network(""),
        ),
      ),
    );
  }
}

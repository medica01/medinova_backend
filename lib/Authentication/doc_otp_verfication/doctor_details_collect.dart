import 'package:flutter/material.dart';

import '../../allfun.dart';

class doc_details_col extends StatefulWidget {
  const doc_details_col({super.key});

  @override
  State<doc_details_col> createState() => _doc_details_colState();
}

class _doc_details_colState extends State<doc_details_col> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: doc_det_collect(),
    );
  }
}

class doc_det_collect extends StatefulWidget {
  const doc_det_collect({super.key});

  @override
  State<doc_det_collect> createState() => _doc_det_collectState();
}

class _doc_det_collectState extends State<doc_det_collect> {
  final TextEditingController first_name = TextEditingController();
  final TextEditingController last_name = TextEditingController();
  final TextEditingController  email= TextEditingController();
  final TextEditingController language = TextEditingController();
  final TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: screen.height * 0.89,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.black, width: 2),
                // color: Colors.red,
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "fill the details",
                        style: TextStyle(
                            color: Color(0xff1f8acc),
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 8.0,bottom: 8,left: 13,right: 13),
                          child: TextFormField(
                            autofocus: true,
                            clipBehavior: Clip.hardEdge,
                            cursorColor: Color(0xff1f8acc),
                            style: TextStyle(color: Color(0xff1f8acc)),
                            decoration: InputDecoration(
                              focusColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black, width: 2.0), // Focused border color
                                ),
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: "First name",
                                hintStyle: TextStyle(color: Color(0xff1f8acc)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.merge(
                                    BorderSide(color: Colors.black),
                                    BorderSide.none,
                                  ),
                                )),
                          ),
                        ),
                        doc_form_field("last name",last_name)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

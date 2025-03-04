import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:health_hub/Backend_information/Backend_doctor_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../main.dart';
import 'chatting_user_to_doc_2.dart';

class message_page extends StatefulWidget {
  const message_page({super.key});

  @override
  State<message_page> createState() => _message_pageState();
}

class _message_pageState extends State<message_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Message",
              style: TextStyle(
                  color: Color(0xff0a8eac), fontWeight: FontWeight.bold),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                ),
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: 360,
                      child: SearchBar(
                        leading: Icon(Icons.search),
                        hintText: 'Search a Doctor',

                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        // shadowColor: WidgetStatePropertyAll(Colors.grey),
                        elevation: WidgetStatePropertyAll(6.0),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 16.0)),
                      ),
                    )),
              ),
            ),
          ),
          body: show_all_doctor()),
    );
  }
}

class show_all_doctor extends StatefulWidget {
  const show_all_doctor({super.key});

  @override
  State<show_all_doctor> createState() => _show_all_doctorState();
}

class _show_all_doctorState extends State<show_all_doctor> {
  List<doctor_details> chattting_doc = [];
  String errormessage = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatting_doc();
  }
  Future<void> _chatting_doc() async {
    try {
      final response = await http.get(
        Uri.parse("http://$ip:8000/doctor_details/doctor_addetails/"),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = await jsonDecode(response.body);
        setState(() {
          chattting_doc = jsonResponse
              .map((data) => doctor_details.fromJson(data))
              .toList();
        });
      } else {
        setState(() {
          errormessage = "failed to load doctor_details";
        });
      }
    } catch (e) {
      setState(() {
        errormessage = e.toString();
        print("$errormessage");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Active Now",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // ✅ Allow horizontal scrolling
            child: Row(
              children: chattting_doc.map((show_docc) {
                return show_docc.id != null
                    ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          show_docc.doctorImage != null
                              ? "http://$ip:8000${show_docc.doctorImage}"
                              : "no data ",
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        show_docc.doctorName ?? "Unknown",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
                    : SizedBox();
              }).toList(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Messages",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        ListView.builder(
          shrinkWrap: true,
            itemCount: chattting_doc.length,
            itemBuilder: (context, index) {
              var show_docc = chattting_doc[index];
              return show_docc.id != null
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>user_doc(data:"${show_docc.doctorPhoneNo}")));
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        shadowColor: Colors.grey,
                        child: Container(
                          height: 100,
                          // color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                    // scale: 10,
                                    show_docc.doctorImage != null
                                        ? "http://$ip:8000${show_docc.doctorImage}"
                                        : "no data ",
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${show_docc.doctorName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Text("${show_docc.specialty}",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  : Text("data");
            })
      ],
    );
  }
}

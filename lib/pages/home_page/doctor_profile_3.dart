import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_hub/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:health_hub/pages/home_page/all_doctor_2.dart';

class doc_profile extends StatefulWidget {
  final dynamic data;

  doc_profile({super.key, required this.data});

  @override
  State<doc_profile> createState() => _doc_profileState();
}

class _doc_profileState extends State<doc_profile> {
  bool heart = false;
  List<doctor_details> doctor_detail = [];
  bool isLoading = true;
  String? errorMessage;
  String? pk;

  @override
  void initState() {
    super.initState();
    pk = widget.data;
    _showdoctor();
  }

  Future<void> _showdoctor() async {
    final url = Uri.parse(
        "http://$ip:8000/doctor_details/doctor_editdetails/$pk/"); // Specific doctor's details
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // Assuming the response is a single JSON object, not a list
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          doctor_detail = [doctor_details.fromJson(jsonResponse)];
          isLoading = false;
        });
        print(jsonResponse); // Log raw JSON response
      } else {
        setState(() {
          errorMessage = "Failed to load doctor details.";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scr = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor's Profile"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),

      body: Stack(
        children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: doctor_detail.length,
            itemBuilder: (context, index) {
              var doctor = doctor_detail[index];
              return doctor.id != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  doctor.doctorImage != null
                                      ? "http://$ip:8000${doctor.doctorImage}"
                                      : "no data",
                                  scale: 5,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        doctor.doctorName ?? "Unknown",
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      Text(
                                        doctor.specialty ?? "No qualification",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      Text("${doctor.service} years of exp"),
                                      Text(doctor.language ?? "Tamil"),
                                      Text(doctor.doctorLocation ?? "Chennai"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 300,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 28.0, left: 15),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About Doctor",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(doctor.bio ?? "no bio")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 28.0, left: 15),
                          child: Text(
                            "Treatment and producedures",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 8.0,left: 15),
                          child: Text(doctor.specialty ?? "no report"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 28.0, left: 15),
                          child: Text(
                            "Registration",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 8.0,left: 15),
                          child: Text("${doctor.regNo}" ?? "no report"),
                        ),

                        Container(
                          height: 200,
                        )
                      ],
                    )
                  : const Text("No data available");
            },
          ),
          Positioned(
            bottom: 80,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  // Handle button tap
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.92,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text(
                      "Book Free Consult",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





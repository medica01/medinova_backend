import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_hub/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Authentication/otp_verfication/phone_otp.dart';
import '../../allfun.dart';

class update_profile {
  int? id;
  String? createdAt;
  String? firstName;
  String? lastName;
  String? gender;
  String? age;
  int? phoneNumber;
  String? email;
  String? location;
  String? userPhoto;

  update_profile(
      {this.id,
        this.createdAt,
        this.firstName,
        this.lastName,
        this.gender,
        this.age,
        this.phoneNumber,
        this.email,
        this.location,
        this.userPhoto});

  update_profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    age = json['age'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    location = json['location'];
    userPhoto = json['user_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['location'] = this.location;
    data['user_photo'] = this.userPhoto;
    return data;
  }
}


class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  Future<bool> signOutFromGoogle() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Remove the 'login' key to clear the logged-in state
      await prefs.remove('login');
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => PhoneEntryPage()),
        (route) => false,
      );

      return true;
    } catch (e) {
      print('Sign-out error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfffdfdfd),
          title: text("Profile", Colors.black, 30, FontWeight.bold),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => signOutFromGoogle(),
                  icon: Icon(
                    Icons.logout,
                    color: Color(0xff1f8acc),
                    size: 30,
                  ),
                )),
          ],
        ),
        body: const profile(),
      ),
    );
  }
}

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: OutlinedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return SaveDetails();
                    });
              },
              child: Text(
                "Create Profile",
                style: TextStyle(color: Color(0xff1f8acc), fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(100, 50),
                // Ensures the button is at least this size
                padding: EdgeInsets.zero,
                // Ensures no extra padding affects width
                side: BorderSide(color: Color(0xff1f8acc)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SaveDetails extends StatefulWidget {
  const SaveDetails({super.key});

  @override
  State<SaveDetails> createState() => _SaveDetailsState();
}

class _SaveDetailsState extends State<SaveDetails> {
  final _form = GlobalKey<FormState>();
  final List<String> genders = ["Male", "Female", "Other"];
  int selectedGenderIndex = 0; // Default gender is "Male"
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  Future<void> _updateuser() async{
    String first_name = firstnamecontroller.text;
    String last_name = lastnamecontroller.text;
    String age = agecontroller.text;
    String gender = genders[selectedGenderIndex];
    String email = emailcontroller.text;
    try{
      final response =await http.put(Uri.parse('http://$ip:8000/user_profile/user_edit/3/'),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode({
          'first_name':first_name,
          'last_name':last_name,
          'gender':gender,
          'age': age,
          'email':email
        })
      );

      if(response.statusCode==200 || response.statusCode==204){
        Navigator.pop(context);
      }else{
        print('update user details failed:${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Update user details failed: ${response.body}")),);
      }

    }catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    }
  }

  void _validateandsave() {
    List<String> missingfields = [];
    if (firstnamecontroller.text.isEmpty) {
      missingfields.add("enter first name");
    }
    if (lastnamecontroller.text.isEmpty) {
      missingfields.add("enter last name");
    }
    if (agecontroller.text.isEmpty) {
      missingfields.add("enter age correctly");
    }
    if (emailcontroller.text.isEmpty) {
      missingfields.add("enter email id");
    }

    if (missingfields.isNotEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                  "Missing Fields",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                content: Text("${missingfields.join("\n")}"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Color(0xff1f8acc)),
                    ),
                  ),
                ],
              ));
    } else {
      if (missingfields.isEmpty) {
        _updateuser();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Lock orientation to portrait mode for this page
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    // Reset orientation to allow rotation when leaving this page
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    agecontroller.dispose();
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scr = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: 720, // Adjusted height to fit the new gender feature
        width: scr.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 300,
              color: Colors.grey.withOpacity(0.7),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Add User Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 25,
                endIndent: 35,
              ),
              // First Name Field
              Flexible(
                child: textfielld2(
                  Colors.grey.withOpacity(0.2),
                  Colors.grey.withOpacity(0.6),
                  const Color(0xff1f8acc),
                  BorderRadius.circular(30),
                  const EdgeInsets.all(20),
                  30,
                  10,
                  "Enter the first name",
                  firstnamecontroller,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: textfielld2(
                      Colors.grey.withOpacity(0.2),
                      Colors.grey.withOpacity(0.6),
                      const Color(0xff1f8acc),
                      BorderRadius.circular(30),
                      const EdgeInsets.all(20),
                      30,
                      10,
                      "Enter the last name",
                      lastnamecontroller),
                ),
              ),
              // Age Field
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: Text(
                        "Age:",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff1f8acc),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 150,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: agecontroller,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.blue.withOpacity(0.5)),
                          cursorColor: Colors.blue,
                          maxLength: 3,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          // validator: (value) {
                          //
                          //   int? age = int.tryParse(value!);
                          //   if (age == null || age > 100) {
                          //     return "Enter age (1-100)";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "Enter the age",
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, bottom: 10),
                child: Text(
                  "Gender:",
                  style: TextStyle(color: Color(0xff1f8acc), fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    genders.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGenderIndex = index;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: selectedGenderIndex == index
                              ? Color(0xff1f8acc)
                              : Colors.transparent,
                          border: Border.all(
                            color: Color(0xff1f8acc),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            genders[index],
                            style: TextStyle(
                              color: selectedGenderIndex == index
                                  ? Colors.white
                                  : Color(0xff1f8acc),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: textfielld2(
                      Colors.grey.withOpacity(0.2),
                      Colors.grey.withOpacity(0.6),
                      const Color(0xff1f8acc),
                      BorderRadius.circular(30),
                      const EdgeInsets.all(20),
                      30,
                      10,
                      "Enter your Email",
                      emailcontroller),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.0, bottom: 20),
                child: Container(
                  width: 335,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Color(0xff1f8acc)), // Set border color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(40), // Rounded corners
                            ),
                          ),
                          child: SizedBox(
                            width: 100,
                            height: 40, // Set the desired width
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Color(0xff1f8acc),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ), // Ensure text is centered
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          _validateandsave();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff1f8acc),
                                borderRadius: BorderRadius.circular(40)),
                            child: SizedBox(
                              width: 150,
                              height: 40, // Set the desired width
                              child: Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ), // Ensure text is centered
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

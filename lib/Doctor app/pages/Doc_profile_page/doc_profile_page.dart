import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Authentication/doc_otp_verfication/doc_otp_verify.dart';
import '../../../allfun.dart';

class doc_profiles extends StatefulWidget {
  const doc_profiles({super.key});

  @override
  State<doc_profiles> createState() => _doc_profilesState();
}

class _doc_profilesState extends State<doc_profiles> {
  Future<bool> signOutFromDocphone() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Remove the 'login' key to clear the logged-in state
      await prefs.remove('doc_login');

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => doc_otp()),
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
                  // onPressed: () {
                  //   if (kIsWeb) {
                  //     signOutFromGoogleWeb(context);
                  //   } else {
                  //     signOutFromGoogleAnd();
                  //   }
                  // },
                  onPressed: ()=>signOutFromDocphone(),
                  icon: Icon(
                    Icons.logout,
                    color: Color(0xff1f8acc),
                    size: 30,
                  ),
                )),
          ],
        ),
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

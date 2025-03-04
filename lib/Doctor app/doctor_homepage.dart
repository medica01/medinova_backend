// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:health_hub/Doctor%20app/pages/Doc_Booking_patient_history/Doc_booking_patient_history.dart';
// import 'package:health_hub/Doctor%20app/pages/Doc_home_page/Doc_home_page.dart';
// import 'package:health_hub/Doctor%20app/pages/Doc_locations_page/doc_location_page.dart';
// import 'package:health_hub/Doctor%20app/pages/Doc_message_page/doc_message_page.dart';
// import 'package:health_hub/Doctor%20app/pages/Doc_profile_page/doc_profile_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../user app/pages/home_page/doctor_profile_3.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this, initialIndex: 2);
//     // _tabController.animateTo(2); //
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white10,
//         body: Stack(
//           children: [
//             Positioned.fill(
//               child: TabBarView(
//                 physics: NeverScrollableScrollPhysics(),
//                 dragStartBehavior: DragStartBehavior.down,
//                 controller: _tabController,
//                 children: [
//                   // Replace with your respective pages
//                   doc_location(),
//                   doc_message(),
//                   doc_home(),
//                   doc_profiles(),
//                   doc_book_pati(),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 //color: Colors.red,
//                 height: 70,
//                 child: Stack(
//                   children: [
//                     CustomPaint(
//                       size: Size(MediaQuery.of(context).size.width, 80),
//                       painter: BottomNavigationBarPainter(),
//                     ),
//                     Center(
//                       heightFactor: 0.1,
//                       child: Container(
//                         height: 55,
//                         width: 55,
//                         decoration: BoxDecoration(shape: BoxShape.circle),
//                         clipBehavior: Clip.hardEdge,
//                         child: FloatingActionButton(
//                           onPressed: () {
//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (context) => main_home()));
//                           },
//                           backgroundColor: Color(0xff1f8acc),
//                           child: Icon(
//                             Icons.home,
//                             color: Colors.white,
//                           ),
//                           elevation: 1.5,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       // color: Colors.white,
//                       height: 70,
//                       child: TabBar(
//                         controller: _tabController,
//                         labelColor: Color(0xff1f8acc),
//                         unselectedLabelColor: Colors.black,
//                         indicatorColor: Colors.transparent,
//                         // Hide the tab indicator line
//                         tabs: [
//                           Tab(icon: Icon(FontAwesomeIcons.location)),
//                           Tab(icon: Icon(Icons.message_outlined)),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 20,
//                           ),
//                           Tab(icon: Icon(Icons.person)),
//                           Tab(icon: Icon(Icons.history)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class BottomNavigationBarPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;
//     Path path = Path();
//     path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
//     path.arcToPoint(Offset(size.width * 0.60, 20),
//         radius: Radius.circular(40.0), clockwise: false);
//     path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_hub/Doctor%20app/pages/Doc_Booking_patient_history/Doc_booking_patient_history.dart';
import 'package:health_hub/Doctor%20app/pages/Doc_home_page/Doc_home_page.dart';
import 'package:health_hub/Doctor%20app/pages/Doc_locations_page/doc_location_page.dart';
import 'package:health_hub/Doctor%20app/pages/Doc_message_page/doc_message_page.dart';
import 'package:health_hub/Doctor%20app/pages/Doc_profile_page/doc_profile_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onNavRailTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white10,
        body: Row(
          children: [
            if (kIsWeb) // Show NavigationRail for Web
              NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onNavRailTapped,
                labelType: NavigationRailLabelType.all,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(FontAwesomeIcons.location),
                    label: Text('Location'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.message_outlined),
                    label: Text('Messages'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text('Profile'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.history),
                    label: Text('History'),
                  ),
                ],
              ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  doc_location(),
                  doc_message(),
                  doc_home(),
                  doc_profiles(),
                  doc_book_pati(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: !kIsWeb
            ? BottomNavigationBarWidget(controller: _tabController)
            : null,
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  final TabController controller;
  const BottomNavigationBarWidget({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 80),
            painter: BottomNavigationBarPainter(),
          ),
          Center(
            heightFactor: 0.1,
            child: FloatingActionButton(
              onPressed: () {
                controller.animateTo(2);
              },
              backgroundColor: Color(0xff1f8acc),
              child: Icon(Icons.home, color: Colors.white),
              elevation: 1.5,
            ),
          ),
          Positioned.fill(
            child: TabBar(
              controller: controller,
              labelColor: Color(0xff1f8acc),
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.location)),
                Tab(icon: Icon(Icons.message_outlined)),
                Container(width: 40),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.history)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(40.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
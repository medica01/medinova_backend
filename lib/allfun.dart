import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget text(String text, Color color, double size, FontWeight weight) {
  return Container(
    child: Text(
      text,
      textScaler: TextScaler.linear(1),
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    ),
  );
}
Widget textfield2(Color c1, Color c2, Color c3, double int, Offset offset,
    BorderRadius br, EdgeInsets ei, String text) {
  return Container(
    decoration: BoxDecoration(borderRadius: br, color: c1, boxShadow: [
      BoxShadow(color: c2, blurRadius: int, offset: offset, spreadRadius: 2)
    ]),
    child: TextFormField(
      style: TextStyle(color: c3),
      cursorColor: c3,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        // focusedBorder: InputBorder.none,
        hintText: text,
        hintStyle: TextStyle(
          color: c3,
        ),
        contentPadding: ei,
        border: OutlineInputBorder(
            borderRadius: br,
            borderSide: BorderSide.merge(
              BorderSide(color: Colors.red),
              BorderSide.none,
            )),
      ),
    ),
  );
}
Widget textfielld2(
    Color c1,
    Color c2,
    Color c3,
    BorderRadius br,
    EdgeInsets ei,
    double hor,
    double ver,
    String text,
     // String retun,
    TextEditingController txt,
    ) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: hor, vertical: ver),
    decoration: BoxDecoration(
      borderRadius: br,
      color: c1,
    ),
    child: TextFormField(
      controller: txt,
      style: TextStyle(color: c3),
      // controller: txt,
      cursorColor: c3,
      // keyboardType: inputtype,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return retun;
      //   }
      //   return null;
      // },
      decoration: InputDecoration(

        errorStyle: TextStyle(height: 0),
        hintText: text,
        hintStyle: TextStyle(color: c2),
        contentPadding: ei,
        border:
        OutlineInputBorder(borderRadius: br, borderSide: BorderSide.none),
      ),

    ),
  );
}

// appbar functions
AppBar customAppBar(String title, {bool centertitle = false}) {
  return AppBar(
    title: Text(title, style: TextStyle(color: Color(0xff1f8acc))),
    backgroundColor: Colors.white,
    centerTitle: centertitle,
  );
}


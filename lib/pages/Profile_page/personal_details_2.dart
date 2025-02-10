import 'package:flutter/material.dart';
import 'package:health_hub/allfun.dart';

class personal_details extends StatefulWidget {
  const personal_details({super.key});

  @override
  State<personal_details> createState() => _personal_detailsState();
}

class _personal_detailsState extends State<personal_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Personal details",centertitle: true,),
      body: details(),
    );

  }
}

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("personal details page"),
    );
  }
}

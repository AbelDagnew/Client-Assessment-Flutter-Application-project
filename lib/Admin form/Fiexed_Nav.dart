import 'package:flutter/material.dart';
import 'package:untitled4/NavBar.dart';
import 'NavBar.dart';

class Fixed_Nav extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "RENSYS ENGINEERING",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),

      ),
    );
  }
}

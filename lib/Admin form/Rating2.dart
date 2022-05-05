import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:untitled4/AdminNav.dart';

import 'NavBar.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Rating2());
}

class Rating2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController data1 = TextEditingController();
  TextEditingController data2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AdminNavBar(),
    appBar: AppBar(
    centerTitle: true,
    title: Text(
     "RENSYS ENGINEERING",

    ),

    ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Rate Our Application',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130.0,),
                    child: Text(
                      "Rate By Number(1-5)",

                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: data1,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[1-5]')),
                    ],
                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent,),

                        // borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Rate 1-5',

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,),
                        borderRadius: BorderRadius.circular(5),

                      ),

                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0,),
                    child: Text(
                      "Comment",

                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  TextFormField(
                    minLines: 2,
                    maxLines: 5,
                    controller: data2,

                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20.0),

                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent,),

                        // borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Write Your Comment here',

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        // width: double.infinity,
                        child: FlatButton(
                            color: Colors.blueAccent,
                            splashColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                                registerNewUserr(context);

                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void registerNewUserr(BuildContext context) async{

      Map <String,dynamic> data= {
        "Rate By Number":data1.text,
        "Comment":data2.text,

              };

      await FirebaseFirestore.instance.collection('Rate').add(data);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Rating2();
        }),
      );

}}

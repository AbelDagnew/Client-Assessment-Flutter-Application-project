import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

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
      home: DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "RENSYS ENGINEERING",

        ),

      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.cyan,
            padding: EdgeInsets.only(left: 30,right: 30),
            child: Text('Rating ',style: TextStyle
              (color: Colors.white,fontSize: 15),
            ),
            onPressed: _showRatingAppDialog,
          ),
        ),
      ),
    );

  }

  void _showRatingAppDialog() {
    final _ratingDialog = RatingDialog(
      ratingColor: Colors.amber,
      title: 'Rating Rensys App',
      message: 'Rating this app and tell others what you think.'
          ' Add more description here if you want.',
      image: Image.asset("images/log.png",
        height: 100,),
      submitButton: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) async {
        Map <String,dynamic> data= {
          "Rate By Number":response.rating,
          "Comment":response.comment,

        };

        await FirebaseFirestore.instance.collection('Rate').add(data);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Rating2();
          }),
        );



        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }

}
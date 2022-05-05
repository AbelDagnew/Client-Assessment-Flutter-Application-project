 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/AdminNav.dart';
import 'package:untitled4/AdminRecLight.dart';
import 'package:untitled4/AdminRecPump.dart';
import 'package:untitled4/solar/AdminRecTv.dart';
import 'package:untitled4/solar/Household.dart';
import 'package:untitled4/solar/VideoScreen.dart';
import 'package:untitled4/solar/translations/codegen_loader.g.dart';
import 'package:untitled4/solar2/VideoScreen.dart';
import 'Household.dart';
import 'package:untitled4/Household.dart';
import 'package:untitled4/solar2/Household.dart';
import 'package:untitled4/VideoScreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: AdminRecord(),
    debugShowCheckedModeBanner: false,
  ));
}
class AdminRecord extends StatefulWidget {


  @override
  _AdminRecordState createState() => _AdminRecordState();
}

class _AdminRecordState extends State<AdminRecord> {
  String email= "";
  Future getEmail()async{
    SharedPreferences preference = await SharedPreferences.getInstance();
    setState(() {
      email = preference.getString('email');
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        title: Text('Choose Material'),
        centerTitle: true,

      ),
      body: Container(
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image:  DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'images/bg2.jpg',
              ),

            )
        ),
        child: Center(
          child: Container(

            width: 330,
            height: 350,
            alignment: Alignment.topCenter,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(width: 2,color: Colors.black12),
              color: Colors.white54,

            ),

            child: Column(
              children:<Widget> [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text('Material Type',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black,decoration: TextDecoration.underline,),
                  ),
                ),
                Column(
                  children: [
                    FlatButton(


                        color: Colors.blueAccent,
                        splashColor: Colors.red,


                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return AdminPumpRec();
                            }),
                          );

                        },
                        child:Text('Solar Pump', style: TextStyle(color: Colors.white),)
                    ),
                    SizedBox(width: 240,),
                    RaisedButton(


                        color: Colors.blueAccent,
                        splashColor: Colors.red,


                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {


                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return AdminRecTv() ;
                            }),
                          );



                        },
                        child: Text('Solar Tv', style: TextStyle(
                            color: Colors.white),)
                    ),
                    SizedBox(width: 240,),
                    RaisedButton(


                        color: Colors.blueAccent,
                        splashColor: Colors.red,


                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {


                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return AdminRecLight() ;
                            }),
                          );



                        },
                        child: Text('Solar Home System', style: TextStyle(
                            color: Colors.white),)
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

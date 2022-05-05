import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/AdminNav.dart';
import 'package:untitled4/solar/Household.dart';
import 'package:untitled4/solar/VideoScreen.dart';
import 'package:untitled4/solar/translations/codegen_loader.g.dart';
import 'package:untitled4/solar2/VideoScreen.dart';
import 'Household.dart';
import 'package:untitled4/Household.dart';
import 'package:untitled4/solar2/Household.dart';
import 'package:untitled4/VideoScreen.dart';
import 'agentsignup.dart';
import 'adminsignup.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: BeforeSignup(),
    debugShowCheckedModeBanner: false,
  ));
}
class BeforeSignup extends StatefulWidget {


  @override
  _BeforeSignupState createState() => _BeforeSignupState();
}

class _BeforeSignupState extends State<BeforeSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        title: Text('Admin Panel'),
        centerTitle: true,

      ),
      body: Container(
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image:  DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'images/bg.png',
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
              color: Colors.white,

            ),

            child: Column(
              children:<Widget> [
                Padding(
                  padding: const EdgeInsets.only(top: 50,bottom: 20),
                  child: Text('Sign Up',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 28,color: Colors.deepOrange,),
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
                              return SignupAgent();
                            }),
                          );

                        },
                        child:Text('Agent Signup', style: TextStyle(color: Colors.white),)
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
                              return SignupAdmin() ;
                            }),
                          );



                        },
                        child: Text('Admin Signup ', style: TextStyle(
                            color: Colors.white),)
                    ),
                    SizedBox(width: 240,),


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

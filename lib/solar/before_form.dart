import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/solar/Household.dart';
import 'package:untitled4/solar/translations/codegen_loader.g.dart';
import 'Household.dart';
import 'package:untitled4/Household.dart';
import 'package:untitled4/solar2/Household.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: BeforeSubmit(),
    debugShowCheckedModeBanner: false,
  ));
}
class BeforeSubmit extends StatefulWidget {


  @override
  _BeforeSubmitState createState() => _BeforeSubmitState();
}

class _BeforeSubmitState extends State<BeforeSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              return Household_profile_Registeration_form();
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
                              return Household_profile_Registeration_formsolar() ;
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
                              return Household_profile_Registeration_formsolar2() ;
                            }),
                          );



                        },
                        child: Text('SHS', style: TextStyle(
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

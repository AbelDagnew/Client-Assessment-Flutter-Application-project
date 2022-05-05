import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:untitled4/Admin_Record.dart';
import 'package:untitled4/Admin form//before_form.dart';
import 'package:untitled4/before_record.dart';
import 'package:untitled4/choosesignup.dart';
import 'package:untitled4/regagent.dart';
import 'package:untitled4/signinAdmin.dart';
import 'Admin form/Aboutus.dart';
import 'Aligator.dart';

import 'capital_physical.dart';
import 'VideoScreen.dart';
import 'adminpage.dart';
import 'package:untitled4/Household.dart';
import 'adminpage.dart';
import 'contacts.dart';
import 'home.dart';
class AdminNavBar extends StatefulWidget {
  AdminNavBar({Key key, @required this.uid}): super (key: key);
  final FirebaseFirestore uid;

  @override
  _AdminNavBarState createState() => _AdminNavBarState(uid);
}

class _AdminNavBarState extends State<AdminNavBar> {
  FirebaseFirestore uid;
  getUserData()async{}


  _AdminNavBarState(this.uid);
  List<Alligator> alligators = [
    Alligator(name: "Share", description: " Rensys Engneering"),
  ] ;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          // widget.uid == null?
          UserAccountsDrawerHeader(
            accountName: Text('Admin'),
            accountEmail: Text('Admin Panel'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: AssetImage(
                    'images/logo.png',
                  ),
                  width: 900,
                  height: 900,
                  // fit: BoxFit.cover,
                ),
              ),

            ),

            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage(
                    'images/back.jpg',
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Container(
            child: GestureDetector(
              onLongPress: (){
                color:Colors.lightBlue;
              },
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap:() {
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => BeforeSignup()
                      )
                  );},
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onLongPress: (){
                color:Colors.lightBlue;
              },
              child: ListTile(
                leading: Icon(Icons.people_alt),
                title: Text('Sign Up'),
                onTap:() {
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => BeforeSignup()
                      )
                  );},
              ),
            ),
          ),

          Container(
            child: GestureDetector(
              onLongPress: (){
                color:Colors.lightBlue;
              },
              child: ListTile(
                leading: Icon(Icons.description_outlined),
                title: Text('Register Form'),
                onTap:() {
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => BeforeSubmit()
                      )
                  );},
              ),
            ),
          ),

          Container(
            child: ListTile(
              leading: Icon(Icons.folder),
              title: Text('Recorded Data'),
              onTap:() {
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (context) => AdminRecord()
                    )
                );
              },

              trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,

                  child: Center(
                    child: Text(
                      '8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onLongPress: (){
                color:Colors.lightBlue;
              },
              child: ListTile(
                leading: Icon(Icons.people_alt),
                title: Text('Agents & Admins List '),
                onTap:() {
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => Display()
                      )
                  );},
              ),
            ),
          ),
          Column(
            children: alligators.map((Alligator alligator) => Card(

              child: ListTile(

                leading: Icon(Icons.share),
                title: Text(alligator.name),
                // subtitle: Text(alligator.description),
                onTap: () => share(context,alligator),

              ) ,
            )).toList(),
          ),


          Divider(),
          Container(
            child: ListTile(
              leading: Icon(Icons.people_rounded),
              title: Text('About Us'),
              onTap:() {
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (context) => AboutUs()
                    )
                );
              } ,
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: (){
                FirebaseAuth.instance.signOut();

                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (context) => Signadmin()
                    )
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}

share(BuildContext context, Alligator alligator) {
  final RenderBox box = context.findRenderObject();
  final String text = "${alligator.name} - ${alligator.description}";
  Share.share(text, subject:  alligator.description,
    sharePositionOrigin: box.localToGlobal(Offset.zero) &box.size,);
}


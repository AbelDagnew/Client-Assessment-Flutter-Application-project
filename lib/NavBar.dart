import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:untitled4/before_form.dart';
import 'package:untitled4/before_record.dart';
import 'package:untitled4/questionary.dart';
import 'Aligator.dart';
import 'Aboutus.dart';
import 'Rating.dart';
import 'capital_physical.dart';
import 'VideoScreen.dart';
import 'adminpage.dart';
import 'package:untitled4/Household.dart';
import 'adminpage.dart';
import 'custom.dart';
import 'home.dart';
import 'package:share/share.dart';
import 'material_info.dart';
class NavBar extends StatefulWidget {
  NavBar({Key key, @required this.uid}): super (key: key);
  final FirebaseFirestore uid;

  @override
  _NavBarState createState() => _NavBarState(uid);
}

class _NavBarState extends State<NavBar> {
  FirebaseFirestore uid;
  getUserData()async{}


  _NavBarState(this.uid);
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
            accountName: Text('Agent Pannel'),
            // accountEmail: Text('Abel@gmail.com'),
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
                      MaterialPageRoute(builder: (context) => Home()
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
                title: Text('Registration Form'),
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
            child: GestureDetector(
              onLongPress: (){
                color:Colors.lightBlue;
              },
              child: ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Material Information'),
                onTap:() {
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => MaterialInfo()
                      )
                  );},
              ),
            ),
          ),
          // Container(
          //   child: GestureDetector(
          //     onLongPress: (){
          //       color:Colors.lightBlue;
          //     },
          //     child: ListTile(
          //       leading: Icon(Icons.description_outlined),
          //       title: Text('Customise Form'),
          //       onTap:() {
          //         Navigator.of(context)
          //             .push(
          //             MaterialPageRoute(builder: (context) => AddQ()
          //             )
          //         );},
          //     ),
          //   ),
          // ),
          // Container(
          //   child: ListTile(
          //     leading: Icon(Icons.folder),
          //     title: Text('Recorded Data'),
          //     onTap:() {
          //       Navigator.of(context)
          //           .push(
          //           MaterialPageRoute(builder: (context) => BeforeRecord()
          //           )
          //       );
          //     },
          //
          //     trailing: ClipOval(
          //       child: Container(
          //         color: Colors.red,
          //         width: 20,
          //         height: 20,
          //
          //         child: Center(
          //           child: Text(
          //             '8',
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 12,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          Column(
            children: alligators.map((Alligator alligator) => Card(

              child: ListTile(

                leading: Icon(Icons.share),
                title: Text(alligator.name),
                // subtitle: Text(alligator.description),
                onTap: () => Share.share('https://play.google.com/store/apps/details?id=com.uefa.ucl', subject: 'Rensys Engineering!'),

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
              leading: Icon(Icons.star),
              title: Text('Rating'),
              onTap:() {
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (context) => Rating2()
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
                    MaterialPageRoute(builder: (context) => HomePage()
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


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:sidebar/Aligator.dart';

class NavBar extends StatelessWidget {
  List<Alligator> alligators = [
    Alligator(name: "Share", description: " Rensys Engneering"),
  ] ;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Abela'),
            accountEmail: Text('Abel@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                    image: AssetImage(
                      'image/avater.jpg',
                    ),
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),

            ),

            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage(
                  'image/back.jpg',
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
                leading: Icon(Icons.description_outlined),
                title: Text('Registration Form'),
                onTap:() =>null ,
              ),
            ),
          ),

          Container(
            child: ListTile(
              leading: Icon(Icons.folder),
              title: Text('Recorded Data'),
              onTap:() =>null ,
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
              onTap:() =>null ,
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap:() =>null ,
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


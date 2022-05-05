import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled4/AdminNav.dart';
import 'package:untitled4/Household.dart';
import 'package:untitled4/NavBar.dart';
import 'package:expandable/expandable.dart';
import 'package:untitled4/map.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Regagent(),
    debugShowCheckedModeBanner: false,
  ));
}
class Regagent extends StatefulWidget {
  @override
  _RegagentState createState() => _RegagentState();
}

class _RegagentState extends State<Regagent> {
  int _currentIndex = 0;
  final tabs =[
    Container(child: Listpage()),
    Container(child: Listpage2()),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        title: Text(
          "Recorded Data",

          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        centerTitle:true,
      ),

      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 30,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.record_voice_over),
                title: Text('Agent Recorded Data'),
                backgroundColor: Colors.blueAccent
            ),


            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_outlined),
                title: Text('Admin Recorded Data'),
                backgroundColor: Colors.green
            ),

          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }

      ),
    );

  }
}
class Listpage extends StatefulWidget {

  @override
  _ListpageState createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  Future _data;
  Future getPosts() async{
    var db = FirebaseDatabase.instance.reference().child("users");
    db.once().then((DataSnapshot snapshot){
        print(snapshot);

    });

  }
  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Detaipage(post: post,)));
  }
  @override
  void initState(){
    super.initState();
    _data = getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: Text("Loading ..."),
              );
            }else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_,index){
                    return ListTile(
                      title: Container(

                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: Offset(0, 0.5), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,left: 10),
                            child: Text(snapshot.data[index]['name']),
                          )),
                      // subtitle: Text("Recorded by:" + snapshot.data[index]['data2']),
                      onTap: () => navigateToDetail(snapshot.data[index]),
                    );
                  });
            }

          }),
    );
  }
}
class Detaipage extends StatefulWidget {

  final DocumentSnapshot post;
  Detaipage({this.post});
  @override
  _DetaipageState createState() => _DetaipageState();
}

class _DetaipageState extends State<Detaipage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.post.get('name')),

      ),
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            child: ListTile(
              title: Text(
                  "1)Fullull Name: " + widget.post.get('name') +
                      "\n\n 2)City: " + widget.post.get('city')  +
                      "\n\n 3)Email: " + widget.post.get('email')  +
                      "\n\n 4)password: " + widget.post.get('password') +
                      "\n\n 5)MobileNumber: " + widget.post.get('phone')


              ),
            ),
          ),
        ),
      ),
    );
  }
}
class Listpage2 extends StatefulWidget {


  @override
  _Listpage2State createState() => _Listpage2State();
}

class _Listpage2State extends State<Listpage2> {
  Future _data;
  Future getPosts() async{
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("Admin").get();
    return qn.docs;
  }
  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Dialogpage2(post: post,)));
  }
  void initState(){
    super.initState();
    _data = getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: Text("Loading ..."),
              );
            }else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_,index){
                    return ListTile(
                      title: Container(

                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: Offset(0, 0.5), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,left: 10),
                            child: Text(snapshot.data[index]['FullName']),
                          )),
                      // subtitle: Text("Recorded by:" + snapshot.data[index]['data2']),
                      onTap: () => navigateToDetail(snapshot.data[index]),
                    );
                  });
            }

          }),
    );
  }
}
class Dialogpage2 extends StatefulWidget {

  final DocumentSnapshot post;
  Dialogpage2({this.post});
  @override
  _Dialogpage2State createState() => _Dialogpage2State();
}

class _Dialogpage2State extends State<Dialogpage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.post.get('FullName')),

      ),
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            child: ListTile(
              title: Text(
                  "1)Fullull Name: " + widget.post.get('FullName') +
                      "\n\n 2)City: " + widget.post.get('City')  +
                      "\n\n 3)Email: " + widget.post.get('Email')  +
                      "\n\n 4)password: " + widget.post.get('password') +
                      "\n\n 5)MobileNumber: " + widget.post.get('MobileNumber')
              ),
            ),
          ),
        ),
      ),
    );
  }
}

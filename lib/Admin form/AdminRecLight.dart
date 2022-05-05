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
    home: AdminRecLight(),
    debugShowCheckedModeBanner: false,
  ));
}
class AdminRecLight extends StatefulWidget {
  @override
  _AdminRecLightState createState() => _AdminRecLightState();
}

class _AdminRecLightState extends State<AdminRecLight> {
  int _currentIndex = 0;
  final tabs =[
    Container(child: Listpage()),
    Container(child: Listpage2()),
    Container(child: Listpage3()),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        title: Text(
          "Recorded Data SHS",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
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
                title: Text('All Recorded Data'),
                backgroundColor: Colors.blueAccent
            ),


            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_outlined),
                title: Text('Eligable Customer'),
                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.record_voice_over),
                title: Text('Not eligable Custpmer'),
                backgroundColor: Colors.red
            )
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
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("AllRecordDataForSolarLight").get();
    return qn.docs;
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
                            child: Text(snapshot.data[index]['data1']),
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
        title: Text(widget.post.get('data1')),
        actions: <Widget>[
          IconButton(
            padding: new EdgeInsets.only(right: 25),
            icon: Icon(

              Icons.room_outlined,
              color: Colors.black,
                size: 40.0
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Map(
                    latitude: widget.post.get('latitude'),
                    longtiud: widget.post.get('longtiud'),
                    agent:widget.post.get('data78') ,

                  );
                }),
              );
              // do something
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            child: ListTile(
              title: Text(
                  "1)Fullull Name: " + widget.post.get('data1') +
                      "\n\n 2)Date of Birth: " + widget.post.get('data2')  +
                      "\n\n 3)Gender: " + widget.post.get('data3')  +
                      "\n\n 4)Martial Status: " + widget.post.get('data4') +
                      "\n\n 5)Educational status: " + widget.post.get('data5')  +
                      "\n\n 6)Home Address: " + widget.post.get('data6')  +
                      "\n\n 7)Head of the Household: " + widget.post.get('data7') +
                      "\n\n 8)How Many Members are There in the Customers Household: " + widget.post.get('data8')  +
                      "\n\n 9)How Many Labors in the Households?(>16 Years Old): " + widget.post.get('data9')  +
                      "\n\n 10)10)How Many Household Members ages 0 to 16 are currently in school: " + widget.post.get('data10') +
                      "\n\n 11)Who is the Farm Manager: " + widget.post.get('data11')  +
                      "\n\n 12)Phone Number: " + widget.post.get('data14')  +
                      "\n\n 13)Registration Date: " + widget.post.get('data15') +
                      "\n\n 14)Have you or your household members have formal debts owed to third parties in the past? What happened when you did not pay your past debts (in time): " + widget.post.get('data48')  +
                      "\n\n 15) How much, do you have left for discretionary (free spending) after all necessary expenses per annum?: " + widget.post.get('data49')  +
                      "\n\n 16)Do men and women in the household keeping any savings aside for future expenses: " + widget.post.get('data50') +
                      "\n\n 17)Where do men and women keep their savings? (Home, Bank, Mobile money account, Village saving and loan association, Other (Please specify)): " + widget.post.get('data51') +
                      "\n\n 18)What is the households currently available cash? (Physical cash + bank/mobile money account): " + widget.post.get('data52') +
                      "\n\n 19)Do you have a financial controlling system in place? (For commercial farmers only): " + widget.post.get('data53') +
                      "\n\n 20)How many months per year the household lives without money to buy additional foods: " + widget.post.get('data54') +
                      "\n\n 21)What is your source of information about irrigation technology/products/services, extension/advisory services: " + widget.post.get('data56') +
                      "\n\n 22)Imagine you have an emergency and you need to pay ETB 5,000. How can you get it in a month? (relative, friends, bank, sell livestock, remittances, etc.): " + widget.post.get('data57')  +
                      "\n\n 23)What would you do to pay back the money: " + widget.post.get('data58')  +
                      "\n\n 24)If you have ETB 5,000, what do you invest in: " + widget.post.get('data59')  +
                      "\n\n 25)Which irrigation equipment do you plan to invest on? And why: " + widget.post.get('data71')  +
                      "\n\n 26)Where do you see the main advantage in acquiring Renesys’s product: " + widget.post.get('data72')  +
                      "\n\n 27)total_point_value: " + widget.post.get('data73').toString()  +
                      "\n\n 28)monitory Result: " + widget.post.get('data74').toString()  +
                      "\n\n 29)Status: " + widget.post.get('data75')  +
                      "\n\n 30)Passing total_point_value: " + widget.post.get('data76')  +
                      "\n\n 31)Passing monitory Result: " + widget.post.get('data77')  +
                      "\n\n 32)Recorded By: " + widget.post.get('data78')










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
    QuerySnapshot qn = await firestore.collection("EligibleForSolarLight").get();
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
                            child: Text(snapshot.data[index]['data1']),
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
        title: Text(widget.post.get('data1')),
        actions: <Widget>[
          IconButton(
            padding: new EdgeInsets.only(right: 25),
            icon: Icon(

                Icons.room_outlined,
                color: Colors.black,
                size: 40.0
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Map(
                    latitude: widget.post.get('latitude'),
                    longtiud: widget.post.get('longtiud'),
                    agent:widget.post.get('data78') ,

                  );
                }),
              );
              // do something
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            child: ListTile(
              title: Text(
                  "1)Fullull Name: " + widget.post.get('data1') +
                      "\n\n 2)Date of Birth: " + widget.post.get('data2')  +
                      "\n\n 3)Gender: " + widget.post.get('data3')  +
                      "\n\n 4)Martial Status: " + widget.post.get('data4') +
                      "\n\n 5)Educational status: " + widget.post.get('data5')  +
                      "\n\n 6)Home Address: " + widget.post.get('data6')  +
                      "\n\n 7)Head of the Household: " + widget.post.get('data7') +
                      "\n\n 8)How Many Members are There in the Customers Household: " + widget.post.get('data8')  +
                      "\n\n 9)How Many Labors in the Households?(>16 Years Old): " + widget.post.get('data9')  +
                      "\n\n 10)10)How Many Household Members ages 0 to 16 are currently in school: " + widget.post.get('data10') +
                      "\n\n 11)Who is the Farm Manager: " + widget.post.get('data11')  +
                      "\n\n 12)Phone Number: " + widget.post.get('data14')  +
                      "\n\n 13)Registration Date: " + widget.post.get('data15') +
                      "\n\n 14)Have you or your household members have formal debts owed to third parties in the past? What happened when you did not pay your past debts (in time): " + widget.post.get('data48')  +
                      "\n\n 15) How much, do you have left for discretionary (free spending) after all necessary expenses per annum?: " + widget.post.get('data49')  +
                      "\n\n 16)Do men and women in the household keeping any savings aside for future expenses: " + widget.post.get('data50') +
                      "\n\n 17)Where do men and women keep their savings? (Home, Bank, Mobile money account, Village saving and loan association, Other (Please specify)): " + widget.post.get('data51') +
                      "\n\n 18)What is the households currently available cash? (Physical cash + bank/mobile money account): " + widget.post.get('data52') +
                      "\n\n 19)Do you have a financial controlling system in place? (For commercial farmers only): " + widget.post.get('data53') +
                      "\n\n 20)How many months per year the household lives without money to buy additional foods: " + widget.post.get('data54') +
                      "\n\n 21)What is your source of information about irrigation technology/products/services, extension/advisory services: " + widget.post.get('data56') +
                      "\n\n 22)Imagine you have an emergency and you need to pay ETB 5,000. How can you get it in a month? (relative, friends, bank, sell livestock, remittances, etc.): " + widget.post.get('data57')  +
                      "\n\n 23)What would you do to pay back the money: " + widget.post.get('data58')  +
                      "\n\n 24)If you have ETB 5,000, what do you invest in: " + widget.post.get('data59')  +
                      "\n\n 25)Which irrigation equipment do you plan to invest on? And why: " + widget.post.get('data71')  +
                      "\n\n 26)Where do you see the main advantage in acquiring Renesys’s product: " + widget.post.get('data72')  +
                      "\n\n 27)total_point_value: " + widget.post.get('data73').toString()  +
                      "\n\n 28)monitory Result: " + widget.post.get('data74').toString()  +
                      "\n\n 29)Status: " + widget.post.get('data75')  +
                      "\n\n 30)Passing total_point_value: " + widget.post.get('data76')  +
                      "\n\n 31)Passing monitory Result: " + widget.post.get('data77')  +
                      "\n\n 32)Recorded By: " + widget.post.get('data78')










              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Listpage3 extends StatefulWidget {


  @override
  _Listpage3State createState() => _Listpage3State();
}

class _Listpage3State extends State<Listpage3> {
  Future _data;
  Future getPosts() async{
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("NotEligibleSolarLight").get();
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
                            child: Text(snapshot.data[index]['data1']),
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
class Dialogpage3 extends StatefulWidget {
  final DocumentSnapshot post;
  Dialogpage3({this.post});

  @override
  _Dialogpage3State createState() => _Dialogpage3State();
}

class _Dialogpage3State extends State<Dialogpage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.post.get('data1')),
        actions: <Widget>[
          IconButton(
            padding: new EdgeInsets.only(right: 25),
            icon: Icon(

                Icons.room_outlined,
                color: Colors.black,
                size: 40.0
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Map(
                    latitude: widget.post.get('latitude'),
                    longtiud: widget.post.get('longtiud'),
                    agent:widget.post.get('data78') ,

                  );
                }),
              );
              // do something
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            child: ListTile(
              title: Text(
                  "1)Fullull Name: " + widget.post.get('data1') +
                      "\n\n 2)Date of Birth: " + widget.post.get('data2')  +
                      "\n\n 3)Gender: " + widget.post.get('data3')  +
                      "\n\n 4)Martial Status: " + widget.post.get('data4') +
                      "\n\n 5)Educational status: " + widget.post.get('data5')  +
                      "\n\n 6)Home Address: " + widget.post.get('data6')  +
                      "\n\n 7)Head of the Household: " + widget.post.get('data7') +
                      "\n\n 8)How Many Members are There in the Customers Household: " + widget.post.get('data8')  +
                      "\n\n 9)How Many Labors in the Households?(>16 Years Old): " + widget.post.get('data9')  +
                      "\n\n 10)10)How Many Household Members ages 0 to 16 are currently in school: " + widget.post.get('data10') +
                      "\n\n 11)Who is the Farm Manager: " + widget.post.get('data11')  +
                      "\n\n 12)Phone Number: " + widget.post.get('data14')  +
                      "\n\n 13)Registration Date: " + widget.post.get('data15') +
                      "\n\n 14)Have you or your household members have formal debts owed to third parties in the past? What happened when you did not pay your past debts (in time): " + widget.post.get('data48')  +
                      "\n\n 15) How much, do you have left for discretionary (free spending) after all necessary expenses per annum?: " + widget.post.get('data49')  +
                      "\n\n 16)Do men and women in the household keeping any savings aside for future expenses: " + widget.post.get('data50') +
                      "\n\n 17)Where do men and women keep their savings? (Home, Bank, Mobile money account, Village saving and loan association, Other (Please specify)): " + widget.post.get('data51') +
                      "\n\n 18)What is the households currently available cash? (Physical cash + bank/mobile money account): " + widget.post.get('data52') +
                      "\n\n 19)Do you have a financial controlling system in place? (For commercial farmers only): " + widget.post.get('data53') +
                      "\n\n 20)How many months per year the household lives without money to buy additional foods: " + widget.post.get('data54') +
                      "\n\n 21)What is your source of information about irrigation technology/products/services, extension/advisory services: " + widget.post.get('data56') +
                      "\n\n 22)Imagine you have an emergency and you need to pay ETB 5,000. How can you get it in a month? (relative, friends, bank, sell livestock, remittances, etc.): " + widget.post.get('data57')  +
                      "\n\n 23)What would you do to pay back the money: " + widget.post.get('data58')  +
                      "\n\n 24)If you have ETB 5,000, what do you invest in: " + widget.post.get('data59')  +
                      "\n\n 25)Which irrigation equipment do you plan to invest on? And why: " + widget.post.get('data71')  +
                      "\n\n 26)Where do you see the main advantage in acquiring Renesys’s product: " + widget.post.get('data72')  +
                      "\n\n 27)total_point_value: " + widget.post.get('data73').toString()  +
                      "\n\n 28)monitory Result: " + widget.post.get('data74').toString()  +
                      "\n\n 29)Status: " + widget.post.get('data75')  +
                      "\n\n 30)Passing total_point_value: " + widget.post.get('data76')  +
                      "\n\n 31)Passing monitory Result: " + widget.post.get('data77')  +
                      "\n\n 32)Recorded By: " + widget.post.get('data78')










              ),
            ),
          ),
        ),
      ),
    );
  }
}
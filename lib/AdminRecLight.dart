import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled4/AdminNav.dart';
import 'package:untitled4/Household.dart';
import 'package:untitled4/NavBar.dart';
import 'package:expandable/expandable.dart';
import 'package:untitled4/map.dart';

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled4/Household.dart';
import 'package:untitled4/pdscren.dart';
import 'NavBar.dart';
import 'package:expandable/expandable.dart';
import 'package:untitled4/map.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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
  final pdf = pw.Document();

  Future<File>savePdf({String name, pw.Document pdf}) async{
    final bytes = pdf.save();
    final documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    final file = File('$documentPath/$name');
    await file.writeAsBytes(bytes);
    final url = file.path;
    return file;
  }

  Future openFile(File file) async{
    final url = file.path;
    await OpenFile.open(url);
  }
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.absolute.path;
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(snapshot.data[index]['data1']),

                          ),
                          onTap: () => navigateToDetail(snapshot.data[index]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(icon: Icon(Icons.picture_as_pdf_sharp),

                                onPressed:() async {

                                  writeOnPdf() async {

                                    final pw.Document pdf = pw.Document(deflate: zlib.encode);
                                    // final ByteData bytes = await rootBundle.load('assets/images/kitten.png');
                                    // final Uint8List byteList = bytes.buffer.asUint8List();

                                    pdf.addPage(

                                        pw.MultiPage(
                                          pageFormat: PdfPageFormat.a4,
                                          margin: pw.EdgeInsets.all(32),
                                          build: (context) => [

                                            pw.Header(
                                              level: 0,
                                              child: pw.Text(snapshot.data[index]['data1'].toString() + " Assessment Report", style: pw.TextStyle(fontSize:13,fontWeight: pw.FontWeight.bold),) ,

                                              padding: pw.EdgeInsets.only(bottom:10,left: 150),

                                            ),


                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Personal Information',  'Result'],
                                              <String>['1)Full Name',snapshot.data[index]['data1'].toString()],
                                              <String>['2)Phone_Number',snapshot.data[index]['data14'].toString()],

                                            ]),
                                            pw.SizedBox(
                                              height: 20,
                                            ),
                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Customer Capital and Finance Management',  'Result'],
                                              <String>['1)Physical Capital',snapshot.data[index]['data80'].toString()],
                                              <String>['2)Natural Capital',snapshot.data[index]['data81'].toString()],
                                              <String>['3)Social Capital',snapshot.data[index]['data82'].toString()],
                                              <String>['4)Livelihood Activities',snapshot.data[index]['data83'].toString()],
                                              <String>['5)total point valuee',snapshot.data[index]['data73'].toString()],
                                            ]),
                                            pw.SizedBox(
                                              height: 20,
                                            ),
                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Monetary Result',  'Result'],
                                              <String>['1)Income-Monetary Result',snapshot.data[index]['data85'].toString()],
                                              <String>['2)Expense-Monetary Result',snapshot.data[index]['data86'].toString()],
                                              <String>['3)Total-Monetary Result',snapshot.data[index]['data74'].toString()],

                                            ]),
                                            pw.SizedBox(
                                              height: 20,
                                            ),
                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Checkup',  'Result'],
                                              <String>['1)Willingness Checkup',snapshot.data[index]['data40'].toString()],
                                              <String>['2)Debt Checkup',snapshot.data[index]['data47'].toString()],
                                              <String>['3)Saving Checkup',snapshot.data[index]['data50'].toString()],

                                            ]),
                                            pw.SizedBox(
                                              height: 20,
                                            ),
                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Passing Assessment Point',  'Result'],
                                              <String>['1)Passing Total Point Result',snapshot.data[index]['data76'].toString()],
                                              <String>['2)Passing Monetary Result',snapshot.data[index]['data77'].toString()],
                                              <String>['3)Assessed By',snapshot.data[index]['data78'].toString()],

                                            ]),
                                            pw.SizedBox(
                                              height: 30,
                                            ),
                                            pw.Paragraph(
                                              text: "Final Decision: " + snapshot.data[index]['data75'].toString(),
                                              style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold),
                                            ),
                                          ],

                                        )
                                    );
                                    return savePdf(name: snapshot.data[index]['data1'].toString() + '.pdf',pdf: pdf);
                                  }

                                  final filep = await writeOnPdf();
                                  openFile(filep);


                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (context) => Pdfviewr(path:fullPath)));
                                },
                              ),
                              IconButton(icon: Icon(Icons.email_outlined),
                                onPressed:() async {
                                  writeOnPdf() async {

                                    final pw.Document pdf = pw.Document(deflate: zlib.encode);
                                    // final ByteData bytes = await rootBundle.load('assets/images/kitten.png');
                                    // final Uint8List byteList = bytes.buffer.asUint8List();


                                    pdf.addPage(

                                        pw.MultiPage(
                                          pageFormat: PdfPageFormat.a4,
                                          margin: pw.EdgeInsets.all(32),
                                          build: (context) => [

                                            pw.Header(
                                              level: 0,
                                              child: pw.Text(snapshot.data[index]['data1'].toString() + " Assessment Report", style: pw.TextStyle(fontSize:13,fontWeight: pw.FontWeight.bold),) ,

                                              padding: pw.EdgeInsets.only(bottom:10,left: 150),

                                            ),


                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Personal Information',  'Result'],
                                              <String>['1)Full Name',snapshot.data[index]['data1'].toString()],
                                              <String>['2)Phone_Number',snapshot.data[index]['data14'].toString()],

                                            ]),
                                            pw.SizedBox(
                                              height: 20,
                                            ),
                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Customer Capital and Finance Management',  'Result'],
                                              <String>['1)Physical Capital',snapshot.data[index]['data80'].toString()],
                                              <String>['2)Natural Capital',snapshot.data[index]['data81'].toString()],
                                              <String>['3)Social Capital',snapshot.data[index]['data82'].toString()],
                                              <String>['4)Livelihood Activities',snapshot.data[index]['data83'].toString()],
                                              <String>['5)total point valuee',snapshot.data[index]['data73'].toString()],
                                            ]),
                                            pw.SizedBox(
                                              height: 20,
                                            ),
                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Monetary Result',  'Result'],
                                              <String>['1)Income-Monetary Result',snapshot.data[index]['data85'].toString()],
                                              <String>['2)Expense-Monetary Result',snapshot.data[index]['data86'].toString()],
                                              <String>['3)Total-Monetary Result',snapshot.data[index]['data74'].toString()],

                                            ]),
                                            pw.SizedBox(
                                              height: 20,
                                            ),
                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Checkup',  'Result'],
                                              <String>['1)Willingness Checkup',snapshot.data[index]['data40'].toString()],
                                              <String>['2)Debt Checkup',snapshot.data[index]['data47'].toString()],
                                              <String>['3)Saving Checkup',snapshot.data[index]['data50'].toString()],

                                            ]),
                                            pw.SizedBox(
                                              height: 20,
                                            ),
                                            pw.Table.fromTextArray(context: context, data: <List<String>>[
                                              <String>['Passing Assessment Point',  'Result'],
                                              <String>['1)Passing Total Point Result',snapshot.data[index]['data76'].toString()],
                                              <String>['2)Passing Monetary Result',snapshot.data[index]['data77'].toString()],
                                              <String>['3)Assessed By',snapshot.data[index]['data78'].toString()],

                                            ]),
                                            pw.SizedBox(
                                              height: 30,
                                            ),
                                            pw.Paragraph(
                                              text: "Final Decision: " + snapshot.data[index]['data75'].toString(),
                                              style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold),
                                            ),
                                          ],

                                        )
                                    );
                                    return savePdf(name: snapshot.data[index]['data1'].toString() + '.pdf',pdf: pdf);
                                  }

                                  final filep = await writeOnPdf();
                                  final save  = await filep.path;
                                  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
                                  String appDocumentsPath = appDocumentsDirectory.path; // 2
                                  String filePath = '$appDocumentsPath'; //

                                  final String path = await _localPath + "/" + snapshot.data[index]['data1'].toString()   ;
                                  File file = File(path);
                                  // file.writeAsString(pdf);

                                  File readFile = File(path);
                                  print("content: ${await readFile.readAsString()}");
                                  final Email email = Email(
                                    body: snapshot.data[index]['data1'] + 'Assessment Report is attached down below '
                                        + "\n\n1)Fullull Name: " +snapshot.data[index]['data1'] +
                                        "\n\n 2)Date of Birth: " + snapshot.data[index]['data2']  +
                                        "\n\n 3)Gender: " + snapshot.data[index]['data3']

                                    ,
                                    subject: snapshot.data[index]['data1'] + 'Assessment Report',
                                    recipients: ['abeltesfaye111@gmail.com'],
                                    cc: ['abeldagnew5@gmail.com'],
                                    bcc: ['abeldagnew5@gmail.com'],
                                    // attachmentPaths: ['$file'],

                                    isHTML: false,
                                  );

                                  await FlutterEmailSender.send(email);

                                },
                              ),
                            ],
                          ),


                        ),
                      ),

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
    QuerySnapshot qn = await firestore.collection("NotEligibleForSolarLight").get();
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



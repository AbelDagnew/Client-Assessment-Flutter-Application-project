import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  // final Stream<QuerySnapshot> users =
  // FirebaseFirestore.instance.collection('users').snapshots();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String studentName, studentId, studeyProgramId, studentGPA;

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentId(id) {
    this.studentId = id;
  }

  getstudentId(id) {
    this.studentId = id;
  }

  getStudyprogram(programId) {
    this.studentId = programId;
  }

  getStudentGPA(gpa) {
    this.studentGPA = gpa;
  }

  createData() {
    print("Created");

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyStudents").doc(studentName);

//Create Map

    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentId,
      "studyProgramID": studeyProgramId,
      "studentGPA": studentGPA
    };

    documentReference.set(students).whenComplete(() {
      print("$studentName created");
    });
  }

  readData() {

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyStudents").doc("studentName");

    documentReference.get().then((datasnapshot)  {
      // print(datasnapshot.data[]);



    } );




  }

  updateData() {
    print("Update data");

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyStudents").doc(studentName);

//Create Map

    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentId,
      "studyProgramID": studeyProgramId,
      "studentGPA": studentGPA
    };

    documentReference.set(students).whenComplete(() {
      print("$studentName Update");
    });
  }

  DeleteData() {
    print("Delete Data");

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyStudents").doc();

    documentReference.delete().whenComplete(() {
      print("$studentName deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ahha"),
      ),
      body: SingleChildScrollView(



          child: Column(





              children: <Widget>[



          Padding(
          padding: EdgeInsets.all(8.0),

      child: TextFormField(
      decoration: InputDecoration(
          labelText: "Name",
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.blue, width: 2.0))),
      onChanged: (String name) {
        getStudentName(name);
      },
    ),
    ),
    Padding(
    padding: EdgeInsets.all(8.0),
    child: TextFormField(
    decoration: InputDecoration(
    labelText: "GPA",
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.blue, width: 2.0))),
    onChanged: (String gpa) {
    getStudentGPA(gpa);
    },
    ),
    ),
    Padding(
    padding: EdgeInsets.all(8.0),
    child: TextFormField(
    decoration: InputDecoration(
    labelText: "Student Id",
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.blue, width: 2.0))),
    onChanged: (String id) {
    getStudentId(id);
    },
    ),
    ),
    Padding(
    padding: EdgeInsets.all(8.0),
    child: TextFormField(
    decoration: InputDecoration(
    labelText: "Study Program",
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.blue, width: 2.0))),
    onChanged: (String programId) {
    getStudyprogram(programId);
    },
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    RaisedButton(
    color: Colors.green,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
    ),
    child: Text("Create"),
    textColor: Colors.white,
    onPressed: () {
    createData();
    }),
    RaisedButton(
    color: Colors.blue,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
    ),
    child: Text("Read"),
    textColor: Colors.white,
    onPressed: () {
    readData();
    }),
    RaisedButton(
    color: Colors.orange,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
    ),
    child: Text("Update"),
    textColor: Colors.white,
    onPressed: () {
    updateData();
    }),
    RaisedButton(
    color: Colors.red,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
    ),
    child: Text("Create"),
    textColor: Colors.white,
    onPressed: () {
    DeleteData();
    })
    ],
    ),




    // Container(
    //   child: StreamBuilder<QuerySnapshot>(
    //     stream: Users,
    //     builder: context,
    //     AsyncSnapshot<QuerySnapshot> snapshot,
    //   ),
    // )
    ],
    ),
    ),
    );
  }
}
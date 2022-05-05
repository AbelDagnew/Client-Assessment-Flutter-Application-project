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
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABBB'),
      ),
    );
  }
}


class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  Future getPosts() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("MyStudents").get();

    return qn.docs;
  }

  // navigateToDetail(DocumentSnapshot post){
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post,)));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  FutureBuilder(
          future: getPosts(),
          // ignore: missing_return
          builder: (_,snapshot) {
            // ignore: missing_return

              return   ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/6,
                      child: Text("Title : " + document['studentName'], ),

                    ),

                  );
                }).toList(),
              );

          }),
    );
  }
}



//
// class DetailPage extends StatefulWidget {
//
//   final DocumentSnapshot post;
//
//   DetailPage({this.post});
//
//   @override
//   _DetailPageState createState() => _DetailPageState();
// }
//
// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Card(
//         child: ListTile(
//           title: Text(widget.post.data["title"]),
//           subtitle: Text(widget.post.data["contents"]),
//
//
//         ),
//       ),
//
//     );
//   }
// }

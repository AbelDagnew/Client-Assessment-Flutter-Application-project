import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled4/Saving.dart';
import 'adminpage.dart';
import 'login.dart';
import 'package:untitled4/Irrigation_Practice.dart';
import 'package:easy_localization/easy_localization.dart';
import './translations/codegen_loader.g.dart';
import './translations/locale_keys.g.dart';
import 'NavBar.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    EasyLocalization(

      path: 'assets/translations',

      supportedLocales: [
        Locale('en'),
        Locale('am'),
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      saveLocale: false,
      useOnlyLangCode: true,
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: AddQ(),
    );
  }
}
class AddQ extends StatefulWidget {


  @override
  _AddQState createState() => _AddQState();
}

class _AddQState extends State<AddQ> {
  TextEditingController idata1 = TextEditingController();
  Future _data;
  String _material;
  Future getPosts() async{
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("AddMaterial").get();
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
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Coose Material",
        ),


      ),
      body:SingleChildScrollView(
        child: Column(

          children: [
            Container(
              width: 600,
              height: 1000,
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
                                  width: 350,
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
                                    child: Text(_material = snapshot.data[index]['data1']),
                                  )),
                              // subtitle: Text("Recorded by:" + snapshot.data[index]['data2']),
                              onTap: () => navigateToDetail(snapshot.data[index]),
                            );
                          });
                    }

                  }),
            ),

          ],
        ),
      ),

    );
  }



}

displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);
}
class Dialogpage2 extends StatefulWidget {

  final DocumentSnapshot post;
  Dialogpage2({this.post});
  @override
  _Dialogpage2State createState() => _Dialogpage2State();
}

class _Dialogpage2State extends State<Dialogpage2> {
  TextEditingController idata1 = TextEditingController();
  Future _data;
  Future getPosts() async{
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection((widget.post.get('data1'))).get();
    return qn.docs;
  }
  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Addquestions(post: post,)));
  }
  void initState(){
    super.initState();
    _data = getPosts();
  }
  String _Mat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.post.get('data1')),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [

            Container(
              width: 600,
              height: 1000,
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
                                  width: 200,
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
                                    child: Text( snapshot.data[index]['data1'] ),
                                  )),
                              // subtitle: Text("Recorded by:" + snapshot.data[index]['data2']),
                              onTap: () => navigateToDetail(snapshot.data[index]),
                            );
                          });
                    }

                  }),
            ),

          ],
        ),
      ),
    );
  }
}
class Addquestions extends StatefulWidget {
  final DocumentSnapshot post;
  Addquestions({this.post});

  @override
  _AddquestionsState createState() => _AddquestionsState();
}

class _AddquestionsState extends State<Addquestions> {
  TextEditingController idata1 = TextEditingController();
  TextEditingController idata2 = TextEditingController();
  Future _data;
  Future getPosts() async{
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection((widget.post.get('data1'))).get();
    return qn.docs;
  }
  navigateToDetaill(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Addquestions(post: post,)));
  }
  void initState(){
    super.initState();
    _data = getPosts();
  }
  var myControllers = [];
  createControllers() {
    myControllers = [];
    for (var i = 0; i < 10; i++) {
      myControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.post.get('data1')),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [

            Container(
              width: 600,
              height: 1000,
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
                                  width: 350,

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
                            child: Form(

                            child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                            children:<Widget>[

                            Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              snapshot.data[index]['data1'],
                              textAlign: TextAlign.left,

                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                            ),

                            Padding(
                            padding: EdgeInsets.only(bottom: 15),

                            child: TextFormField(
                            controller:  myControllers[index],

                            decoration: InputDecoration(
                            border: UnderlineInputBorder(),

                            ),
                            validator:  RequiredValidator(errorText: "Required*"),
                            ),
                            ),

                            ],
                            ),
                            ),



                            ),

                              // subtitle: Text("Recorded by:" + snapshot.data[index]['data2']),
                              )

                            );
                          });
                    }

                  }),
            ),
            Container(


              child: Form(


                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children:<Widget>[

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FlatButton(


                              color: Colors.blueAccent,
                              splashColor: Colors.red,


                              shape: RoundedRectangleBorder(),
                              onPressed: (){
                                registerTitle(context);

                              },
                              child:Text('ADD', style: TextStyle(color: Colors.white),)
                          ),
                          // IconButton(icon: Icon(Icons.email_outlined),
                          //     onPressed:()  { registerNewUserr(context);})
                        ],
                      ),





                    ],
                  ),
                ),



              ),
            ),

          ],
        ),
      ),
    );
  }
  void registerTitle(BuildContext context) async{
    Map <String,dynamic> data= {
      "data1":idata1.text,
      "data2":'Add Question'
    };


    await FirebaseFirestore.instance.collection((widget.post.get('data1'))).add(data);



  }
}


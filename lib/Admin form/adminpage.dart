import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled4/agentsignup.dart';
import 'package:untitled4/home.dart';
import 'package:untitled4/Admin form//signinAdmin.dart';
import 'auth_service.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled4/Widget/Background_image.dart';
import 'package:untitled4/Household.dart';
import 'capital_physical.dart';
import 'signup.dart';

import 'package:untitled4/Irrigation_Practice.dart';
import 'package:easy_localization/easy_localization.dart';
import './translations/codegen_loader.g.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  static String email,role= 'User';
  final String uid;
  HomePage({Key key, @required this.uid}): super (key: key);

  @override
  _HomePageState createState() => _HomePageState(uid);
}

class _HomePageState extends State<HomePage> {
  final String uid;
  _HomePageState(this.uid);
  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  TextEditingController roleTextEditingController = TextEditingController();

  String _email, _password,_Role;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Backgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          'Rensys ',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                    ),

                  ),
                  Text(
                    'Engineering',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[600].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextField(
                                controller: emailTextEditingController,
                                onChanged: (value){
                                  _email=value;
                                },
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 20),
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white54),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Icon(
                                        FontAwesomeIcons.solidEnvelope,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    )),
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[600].withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: TextField(
                                  controller: passwordTextEditingController,
                                  onChanged: (value){
                                    _password=value;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.white54),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Icon(
                                          FontAwesomeIcons.lock,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )),
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(16)),
                                child: FlatButton(
                                  onPressed: ()async {
                                    if(!emailTextEditingController.text.contains("@")){
                                      displayToastMessage("Email address is not valid", context);

                                    }
                                    else if(passwordTextEditingController.text.isEmpty){
                                      displayToastMessage("Password Is Mandatory", context);

                                    }
                                    else{
                                     loginUser(context);
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.all(50),
                                child: Container(
                                  width: double.infinity,

                                  child: FlatButton(
                                    onPressed: ()async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return Signadmin();
                                        }),
                                      );
                                    },
                                    child: Text(
                                      'Sing in as Admin',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.deepOrange),
                                    ),
                                  ),

                                ),
                              ),


                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

 // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 //
 //  void loginUser(BuildContext context) async{
 //
 //    final User firebaserUser = (await _firebaseAuth
 //    .signInWithEmailAndPassword(
 //        email: emailTextEditingController.text,
 //        password: passwordTextEditingController.text).catchError((errMsg){
 //          displayToastMessage("Error: " +errMsg.toString(), context);
 //    })).user;
 //
 //
 //    if(firebaserUser != null){
 //      usersRef.child(firebaserUser.uid).once().then((DataSnapshot snap){
 //        if(snap.value != null)
 //          {
 //           // Navigator.pushNamedAndRemoveUntil(context, MainScreen , (route) => false);
 //            displayToastMessage("you are logged-in now", context);
 //          }
 //        else
 //          {
 //            _firebaseAuth.signOut();
 //            displayToastMessage("No record exists for this user. Please create new account", context);
 //          }
 //      });
 //    }
 //    else{
 //      displayToastMessage("Error Occured, can not been created ", context);
 //    }
    //
    // UserCredential user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password,);
    // await FirebaseFirestore.instance.collection('Users').get();
    // User userr = FirebaseAuth.instance.currentUser;
    //
    // if(user!=null)
    // {
    //
    //
    //
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) {
    //           return Home();
    //         }),
    //       );
    //
    //
    // }
    // else
    // {
    //   print('user does not exist');
    // }
    // final  String email = emailTextEditingController.text.trim();
    // final  String password = passwordTextEditingController.text.trim();
    //  context.read<AuthService>().signUp(
    //    email,
    //    password,
    //  ).then((value) async{
    //    User user = FirebaseAuth.instance.currentUser;
    //    await FirebaseFirestore.instance.collection("agent").doc(user.uid).set({
    //      'uid': user.uid,
    //      'email': email,
    //      'password': password,
    //
    //    });
    //  });
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginUser(BuildContext context) async{
    UserCredential user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password,);
    await FirebaseFirestore.instance.collection('Users').get();
    User userr = FirebaseAuth.instance.currentUser;

    if(user!=null)
    {



      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Home();
        }),
      );


    }
    else
    {
      print('user does not exist');
    }
    // final  String email = emailTextEditingController.text.trim();
    // final  String password = passwordTextEditingController.text.trim();
    //  context.read<AuthService>().signUp(
    //    email,
    //    password,
    //  ).then((value) async{
    //    User user = FirebaseAuth.instance.currentUser;
    //    await FirebaseFirestore.instance.collection("agent").doc(user.uid).set({
    //      'uid': user.uid,
    //      'email': email,
    //      'password': password,
    //
    //    });
    //  });

  }

  displayToastMessage(String message, BuildContext context){
    Fluttertoast.showToast(msg: message);

  }}
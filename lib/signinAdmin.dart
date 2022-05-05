import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/Admin%20form/agentsignup.dart';
import 'package:untitled4/Admin_Record.dart';
import 'package:untitled4/adminpage.dart';
import 'package:untitled4/home.dart';
import 'adminsignup.dart';
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
import './translations/locale_keys.g.dart';
import 'NavBar.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preference = await SharedPreferences.getInstance();
 var email =  preference.getString('email');
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
      child:MyApp(),
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
      home:   Signadmin(),
    );
  }
}

class Signadmin extends StatefulWidget {
  static String email,role= 'User';
  final String uid;
  Signadmin({Key key, @required this.uid}): super (key: key);

  @override
  _SignadminState createState() => _SignadminState(uid);
}

class _SignadminState extends State<Signadmin> {
  final String uid;
  _SignadminState(this.uid);
  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  TextEditingController roleTextEditingController = TextEditingController();

  String _email, _password;
  bool _isChecked = false;
  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }
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
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Text(
                      'Admin Login',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
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
                            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                              SizedBox(
                                  height: 50.0,
                                  width: 50.0,
                                  child: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: Color(0xff00C8E8) // Your color
                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Checkbox(
                                        value: _isChecked,
                                        onChanged: _handleRemeberme
                                      ),
                                    )
                                  )),
                              SizedBox(width: 2.0),
                              Text("Remember Me",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Rubic'))
                            ]),
                          ],
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 10),
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
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  width: double.infinity,

                                  child: FlatButton(
                                    onPressed: ()async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return HomePage();
                                        }),
                                      );
                                    },
                                    child: Text(
                                      'Sing in as Agent',
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

  void _handleRemeberme(bool value) {
    _isChecked = value;
    SharedPreferences.getInstance().then(
          (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailTextEditingController.text);
        prefs.setString('password', passwordTextEditingController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }
  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      print(_remeberMe);
      print(_email);
      print(_password);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        emailTextEditingController.text = _email ?? "";
        passwordTextEditingController.text = _password ?? "";
      }
    } catch (e)
    {
      print(e);
    }
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginUser(BuildContext context) async{
    // try {
    //   UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: _email,
    //       password: _password
    //   );
    //  Navigator.push(
    //    context,
    //    MaterialPageRoute(builder: (context) {
    //      return AdminRecord();
    //    }),
    //  );
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //   }
    // }
    final User firebaseUser = (await _firebaseAuth
        .signInWithEmailAndPassword(
        email: emailTextEditingController.text, password: passwordTextEditingController.text
    ).catchError((errMsg){
      displayToastMessage("Error: " + errMsg.toString(),context);
    })).user;

    if(firebaseUser != null){
      admin.child(firebaseUser.uid).once().then((DataSnapshot snap) async {
        if(snap.value != null){
          SharedPreferences preference = await SharedPreferences.getInstance();
          preference.setString('email', emailTextEditingController.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AdminRecord();
            }),
          );
          displayToastMessage("Successfully Signed in",context);
        }
        else{
          _firebaseAuth.signOut();
          displayToastMessage("No record exist for this user",context);
        }
        });
    }
    // UserCredential user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password,);
    //  await FirebaseFirestore.instance.collection('Admin').get();
    //
    //
    // if(user!=null)
    // {
    //
    //
    //
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) {
    //       return AdminRecord();
    //     }),
    //   );
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

  }

  displayToastMessage(String message, BuildContext context){
    Fluttertoast.showToast(msg: message);

  }}
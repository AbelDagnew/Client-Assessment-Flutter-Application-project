import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled4/home.dart';
import 'package:untitled4/signinAdmin.dart';
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
import 'signinAdmin.dart';
import 'adminpage.dart';
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
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  static String email,role= 'User';
  final String uid;
  MainApp({Key key, @required this.uid}): super (key: key);

  @override
  _MainAppState createState() => _MainAppState(uid);
}

class _MainAppState extends State<MainApp> {
  final String uid;
  _MainAppState(this.uid);
  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  TextEditingController roleTextEditingController = TextEditingController();

  String _email, _password,_Role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),

    ); }}
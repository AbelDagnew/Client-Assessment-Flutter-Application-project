import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled4/AdminNav.dart';
import 'package:untitled4/solar//capital_natural.dart';
import 'adminpage.dart';
import 'package:untitled4/solar//Livelihood_Activities.dart';
import 'login.dart';
import 'package:easy_localization/easy_localization.dart';
import './translations/codegen_loader.g.dart';
import './translations/locale_keys.g.dart';
import 'package:untitled4/NavBar.dart';
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
      home: Social(),
    );
  }
}
class Social extends StatefulWidget {
  final String uid;
  final String data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28;
  Social({Key key, @required this.uid,this.data1,this.data2,this.data3,this.data4,this.data5,this.data6,this.data7,this.data8,this.data9,this.data10,this.data11,this.data12,this.data13,this.data14,this.data15,this.data16,this.data17,this.data18,this.data19,this.data20,this.data21,this.data22,this.data23,this.data24,this.data25,this.data26,this.data27,this.data28}): super (key: key);
  @override
  _SocialState createState() => _SocialState(uid,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28);
}

class _SocialState extends State<Social> {
  final String uid;
  final String data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28;
  _SocialState(this.uid,this.data1,this.data2,this.data3,this.data4,this.data5,this.data6,this.data7,this.data8,this.data9,this.data10,this.data11,this.data12,this.data13,this.data14,this.data15,this.data16,this.data17,this.data18,this.data19,this.data20,this.data21,this.data22,this.data23,this.data24,this.data25,this.data26,this.data27,this.data28);

  TextEditingController ddata1 = TextEditingController();

  TextEditingController ddata2 = TextEditingController();

  TextEditingController ddata3 = TextEditingController();

 String _value;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              value: _value,

              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: [
                DropdownMenuItem(
                  child: Text('🏴󠁧󠁢󠁥󠁮󠁧󠁿 English',),
                  value: 'one',
                  onTap: () async {
                    await context.setLocale(Locale('en'));
                  },

                ),
                DropdownMenuItem(
                  child: Text("🇪🇹 አማርኛ",),
                  value: 'two',
                  onTap: () async {
                    await context.setLocale(Locale('am'));
                  },
                )
              ],
              onChanged: (value) async {
                setState(() {
                  _value = value;
                });
              },
            ),
          )
        ],
        centerTitle: true,
        title: Text("RENSYS ENGINEERING",
        ),
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Text("Solar Tv", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
          preferredSize: Size.fromHeight(0),
        ),

      ),
      body:SingleChildScrollView(
        child: Container(

          // width: 410,
          // alignment: Alignment.topCenter,
          // margin: EdgeInsets.only(left: 5.0,top: 15.0),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
          //   color: Colors.white70,
          // ),
          child: Form(

          key: formkey,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:<Widget>[
                  Text(
                    'Social Capital Form',
                    textAlign: TextAlign.center,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      LocaleKeys.d1.tr(),
                      textAlign: TextAlign.left,

                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: ddata1,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Text(
                    LocaleKeys.d2.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: ddata2,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Text(
                    LocaleKeys.d3.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: ddata3,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,

                      child: FlatButton(


                          color: Colors.blueAccent,
                          splashColor: Colors.red,


                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          onPressed: (){
                            if(formkey.currentState.validate()){
                              registerNewUserr(context);
                            }
                          },
                          child:Text('NEXT', style: TextStyle(color: Colors.white),)
                      ),
                    ),
                  ),

                ],
              ),
            ),



          ),
        ),
      ),

    );
  }

  void registerNewUserr(BuildContext context) async{

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Livelihood(
          uid: uid,
          data1:data1,
          data2:data2,
          data3:data3,
          data4:data4,
          data5:data5,
          data6:data6,
          data7:data7,
          data8:data8,
          data9:data9,
          data10:data10,
          data11:data11,
          data12:data12,
          data13:data13,
          data14:data14,
          data15:data15,
          data16:data16,
          data17:data17,
          data18:data18,
          data19:data19,
          data20:data20,
          data21:data21,
          data22:data22,
          data23:data23,
          data24:data24,
          data25:data25,
          data26:data26,
          data27:data27,
          data28:data28,
          data29:ddata1.text,
          data30:ddata2.text,
          data31:ddata3.text,

        );
      }),
    );

  }
}
displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);
}
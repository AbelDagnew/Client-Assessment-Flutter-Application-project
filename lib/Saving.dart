import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled4/Expenses.dart';
import 'package:untitled4/Surplus_Checking.dart';
import 'adminpage.dart';
import 'login.dart';
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
      home: Saving(),
    );
  }
}
class Saving extends StatefulWidget {
  final String uid;
  final String data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28,data29,data30,data31,data32,data33,data34,data35,data36,data37,data38,data39,data40,data41,data42,data43,data44,data45,data46,data47,data48;
  Saving({Key key, @required this.uid,this.data1,this.data2,this.data3,this.data4,this.data5,this.data6,this.data7,this.data8,this.data9,this.data10,this.data11,this.data12,this.data13,this.data14,this.data15,this.data16,this.data17,this.data18,this.data19,this.data20,this.data21,this.data22,this.data23,this.data24,this.data25,this.data26,this.data27,this.data28,this.data29,this.data30,this.data31,this.data32,this.data33,this.data34,this.data35,this.data36,this.data37,this.data38,this.data39,this.data40,this.data41,this.data42,this.data43,this.data44,this.data45,this.data46,this.data47,this.data48}): super (key: key);
  @override
  _SavingState createState() => _SavingState(uid,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28,data29,data30,data31,data32,data33,data34,data35,data36,data37,data38,data39,data40,data41,data42,data43,data44,data45,data46,data47,data48);
}

class _SavingState extends State<Saving> {

  final String uid;
  final String data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28,data29,data30,data31,data32,data33,data34,data35,data36,data37,data38,data39,data40,data41,data42,data43,data44,data45,data46,data47,data48;
  _SavingState(this.uid,this.data1,this.data2,this.data3,this.data4,this.data5,this.data6,this.data7,this.data8,this.data9,this.data10,this.data11,this.data12,this.data13,this.data14,this.data15,this.data16,this.data17,this.data18,this.data19,this.data20,this.data21,this.data22,this.data23,this.data24,this.data25,this.data26,this.data27,this.data28,this.data29,this.data30,this.data31,this.data32,this.data33,this.data34,this.data35,this.data36,this.data37,this.data38,this.data39,this.data40,this.data41,this.data42,this.data43,this.data44,this.data45,this.data46,this.data47,this.data48);
  TextEditingController hdata1 = TextEditingController();

  TextEditingController hdata2 = TextEditingController();

  TextEditingController hdata3 = TextEditingController();

  TextEditingController hdata4 = TextEditingController();

  TextEditingController hdata5 = TextEditingController();

  TextEditingController hdata6 = TextEditingController();
  TextEditingController hdata7 = TextEditingController();

  TextEditingController hdata8 = TextEditingController();

  String _value;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
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
            child: Text("Solar Pump", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
                    'Saving Form',
                    textAlign: TextAlign.center,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.red),
                  ),
                  Text(
                    LocaleKeys.hh1.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: hdata1,
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
                    LocaleKeys.hh2.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: hdata2,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Text(
                    LocaleKeys.hh3.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: hdata3,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Text(
                    LocaleKeys.hh4.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: hdata4,
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
                    LocaleKeys.hh5.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: hdata5,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Text(
                    LocaleKeys.hh6.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: hdata6,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Text(
                    LocaleKeys.hh7.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: hdata7,
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
                    LocaleKeys.hh8.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: hdata8,
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
        return Surplus(
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
          data29:data29,
          data30:data30,
          data31:data31,
          data32:data32,
          data33:data33,
          data34:data34,
          data35:data35,
          data36:data35,
          data37:data37,
          data38:data38,
          data39:data39,
          data40:data40,
          data41:data41,
          data42:data42,
          data43:data43,
          data44:data44,
          data45:data45,
          data46:data46,
          data47:data47,
          data48:data48,
          data49: hdata1.text,
          data50:hdata2.text ,
          data51:hdata3.text ,
          data52:hdata4.text ,
          data53:hdata5.text ,
          data54:hdata6.text ,
          data55:hdata7.text ,
          data56: hdata8.text,
        );
      }),
    );

  }
}
displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);
}
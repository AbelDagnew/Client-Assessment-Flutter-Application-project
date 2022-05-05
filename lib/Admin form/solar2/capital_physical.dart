import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled4/before_form.dart';
import 'package:untitled4/solar2/Household.dart';
import 'package:untitled4/solar2/capital_natural.dart';
import 'adminpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'Aligator.dart';
import 'Aboutus.dart';
import 'VideoScreen.dart';

import 'package:untitled4/home.dart';
import 'package:easy_localization/easy_localization.dart';
import './translations/codegen_loader.g.dart';
import 'package:untitled4/Investment_Plan.dart';
import './translations/locale_keys.g.dart';

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
      home: Physical(),
    );
  }
}
class Physical extends StatefulWidget {
  final String uid;
  final String data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15;
  Physical({Key key, @required this.uid,this.data1,this.data2,this.data3,this.data4,this.data5,this.data6,this.data7,this.data8,this.data9,this.data10,this.data11,this.data12,this.data13,this.data14,this.data15,}): super (key: key);
  @override
  _PhysicalState createState() => _PhysicalState(uid,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15);

}

class _PhysicalState extends State<Physical> {
  final String uid;
  final String data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15;
  _PhysicalState(this.uid,this.data1,this.data2,this.data3,this.data4,this.data5,this.data6,this.data7,this.data8,this.data9,this.data10,this.data11,this.data12,this.data13,this.data14,this.data15);
  List<Alligator> alligators = [
    Alligator(name: "Share", description: " Rensys Engneering"),
  ] ;
  TextEditingController bdata1 = TextEditingController();

  TextEditingController bdata2 = TextEditingController();

  TextEditingController bdata3 = TextEditingController();

  TextEditingController bdata4 = TextEditingController();

  TextEditingController bdata5 = TextEditingController();

  TextEditingController bdata6 = TextEditingController();

  TextEditingController bdata7 = TextEditingController();

  TextEditingController bdata8 = TextEditingController();



String _value;

GlobalKey<FormState> formkey = GlobalKey<FormState>();
void validate(){
  if(formkey.currentState.validate()){
    print("VAlidate");
  }else{
    print("not Validate");
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Agent'),
              accountEmail: Text('Agent Panel'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage(
                      'images/logo.png',
                    ),
                    width: 900,
                    height: 900,
                    // fit: BoxFit.cover,
                  ),
                ),

              ),

              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage(
                      'images/back.jpg',
                    ),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Container(
              child: GestureDetector(
                onLongPress: (){
                  color:Colors.lightBlue;
                },
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap:() {
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (context) => Home()
                        )
                    );},
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onLongPress: (){
                  color:Colors.lightBlue;
                },
                child: ListTile(
                  leading: Icon(Icons.description_outlined),
                  title: Text('Registration Form'),
                  onTap:() {
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (context) => BeforeSubmit()
                        )
                    );},
                ),
              ),
            ),

            // Container(
            //   child: ListTile(
            //     leading: Icon(Icons.folder),
            //     title: Text('Recorded Data'),
            //     onTap:() {
            //       Navigator.of(context)
            //           .push(
            //           MaterialPageRoute(builder: (context) => VideoScreen2()
            //           )
            //       );
            //     },
            //
            //     trailing: ClipOval(
            //       child: Container(
            //         color: Colors.red,
            //         width: 20,
            //         height: 20,
            //
            //         child: Center(
            //           child: Text(
            //             '8',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 12,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            Column(
              children: alligators.map((Alligator alligator) => Card(

                child: ListTile(

                  leading: Icon(Icons.share),
                  title: Text(alligator.name),
                  // subtitle: Text(alligator.description),
                  onTap: () => share(context,alligator),

                ) ,
              )).toList(),
            ),


            Divider(),
            Container(
              child: ListTile(
                leading: Icon(Icons.people_rounded),
                title: Text('About Us'),
                onTap:() {
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => AboutUs()
                      )
                  );
                } ,
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => HomePage()
                      )
                  );
                },
              ),
            ),

          ],
        ),
      ),
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
            child: Text("Solar House System", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
                    'Physical Capital Form',
                    textAlign: TextAlign.center,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      LocaleKeys.b1.tr(),
                      textAlign: TextAlign.left,

                      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: bdata1,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                       // this prevents keyboard from closing
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),

                    )
                    ),

                  Text(
                    LocaleKeys.b2.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: bdata2,
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
                    LocaleKeys.b3.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: bdata3,
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
                    LocaleKeys.b4.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: bdata4,
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
                    LocaleKeys.b5.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: bdata5,
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
                    LocaleKeys.b6.tr(),                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: bdata6,
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
                    LocaleKeys.b7.tr(),                    textAlign: TextAlign.left,

                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: bdata7,
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
                  // Text(
                  //   LocaleKeys.b8.tr(),
                  //   textAlign: TextAlign.left,
                  //
                  //   style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 15),
                  //   child: TextFormField(
                  //     controller: bdata8,
                  //     decoration: InputDecoration(
                  //       border: UnderlineInputBorder(),
                  //
                  //     ),
                  //     validator:  RequiredValidator(errorText: "Required*"),
                  //   ),
                  // ),
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
        return Natural(
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
          data16:bdata1.text,
          data17:bdata2.text,
          data18:bdata3.text,
          data19:bdata4.text,
          data20:bdata5.text,
          data21:bdata6.text,
          data22:bdata7.text,
          data23:bdata8.text,
        );
      }),
    );
    }



  }

share(BuildContext context, Alligator alligator) {
  final RenderBox box = context.findRenderObject();
  final String text = "${alligator.name} - ${alligator.description}";
  Share.share(text, subject:  alligator.description,
    sharePositionOrigin: box.localToGlobal(Offset.zero) &box.size,);
}
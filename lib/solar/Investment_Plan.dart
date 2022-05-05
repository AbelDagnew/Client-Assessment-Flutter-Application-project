import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker_platform_interface/src/platform_interface/image_picker_platform.dart';
import 'Household.dart';
import 'package:untitled4/solar/Irrigation_Practice.dart';
import 'package:easy_localization/easy_localization.dart';
import './translations/codegen_loader.g.dart';
import './translations/locale_keys.g.dart';
import 'NavBar.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
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
      home: Investment(),
    );
  }
}
class Investment extends StatefulWidget {
  final String uid;
  final  data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28,data29,data30,data31,data32,data33,data34,data35,data36,data37,data38,data39,data40,data41,data42,data43,data44,data45,data46,data47,data48,data49,data50,data51,data52,data53,data54,data55,data56,data57,data58,data59,data60,data61,data62,data63,data64,data65,data66,data67,data68;
  Investment({Key key, @required this.uid,this.data1,this.data2,this.data3,this.data4,this.data5,this.data6,this.data7,this.data8,this.data9,this.data10,this.data11,this.data12,this.data13,this.data14,this.data15,this.data16,this.data17,this.data18,this.data19,this.data20,this.data21,this.data22,this.data23,this.data24,this.data25,this.data26,this.data27,this.data28,this.data29,this.data30,this.data31,this.data32,this.data33,this.data34,this.data35,this.data36,this.data37,this.data38,this.data39,this.data40,this.data41,this.data42,this.data43,this.data44,this.data45,this.data46,this.data47,this.data48,this.data49,this.data50,this.data51,this.data52,this.data53,this.data54,this.data55,this.data56,this.data57,this.data58,this.data59,this.data60,this.data61,this.data62,this.data63,this.data64,this.data65,this.data66,this.data67,this.data68}): super (key: key);
  @override
  _InvestmentState createState() => _InvestmentState(uid,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28,data29,data30,data31,data32,data33,data34,data35,data36,data37,data38,data39,data40,data41,data42,data43,data44,data45,data46,data47,data48,data49,data50,data51,data52,data53,data54,data55,data56,data57,data58,data59,data60,data61,data62,data63,data64,data65,data66,data67,data68);
}

class _InvestmentState extends State<Investment> {
  final String uid;
  final String data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26,data27,data28,data29,data30,data31,data32,data33,data34,data35,data36,data37,data38,data39,data40,data41,data42,data43,data44,data45,data46,data47,data48,data49,data50,data51,data52,data53,data54,data55,data56,data57,data58,data59,data60,data61,data62,data63,data64,data65,data66,data67,data68;
  _InvestmentState(this.uid,this.data1,this.data2,this.data3,this.data4,this.data5,this.data6,this.data7,this.data8,this.data9,this.data10,this.data11,this.data12,this.data13,this.data14,this.data15,this.data16,this.data17,this.data18,this.data19,this.data20,this.data21,this.data22,this.data23,this.data24,this.data25,this.data26,this.data27,this.data28,this.data29,this.data30,this.data31,this.data32,this.data33,this.data34,this.data35,this.data36,this.data37,this.data38,this.data39,this.data40,this.data41,this.data42,this.data43,this.data44,this.data45,this.data46,this.data47,this.data48,this.data49,this.data50,this.data51,this.data52,this.data53,this.data54,this.data55,this.data56,this.data57,this.data58,this.data59,this.data60,this.data61,this.data62,this.data63,this.data64,this.data65,this.data66,this.data67,this.data68);

  TextEditingController kdata1 = TextEditingController();

  TextEditingController kdata2 = TextEditingController();

  TextEditingController kdata3 = TextEditingController();

  TextEditingController kdata4 = TextEditingController();
  TextEditingController kdata5 = TextEditingController();
  TextEditingController kdata6 = TextEditingController();
  TextEditingController kdata7 = TextEditingController();
  String _value;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  File _image;
  final imagePicker = ImagePicker();

  Future getImage() async{
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

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
            child: Text("Solar Tv", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
          preferredSize: Size.fromHeight(0),
        ),

      ),
      body: SingleChildScrollView(
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Investment Plan',
                    textAlign: TextAlign.center,

                    style: const TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      LocaleKeys.k1.tr(),
                      textAlign: TextAlign.left,

                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: kdata1,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Text(
                    LocaleKeys.k2.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: kdata2,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Text(
                    LocaleKeys.k3.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: kdata3,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Text(
                    LocaleKeys.k4.tr(),
                    textAlign: TextAlign.left,

                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: kdata4,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Set Passing Point',
                      textAlign: TextAlign.center,

                      style: const TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Total Point Passing',
                      textAlign: TextAlign.left,

                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: kdata5,
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
                    'Monetary Passing Point',
                    textAlign: TextAlign.left,

                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: kdata6,
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
                    'Agent Full Name',
                    textAlign: TextAlign.left,

                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      controller: kdata7,

                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),

                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(


                          color: Colors.blueAccent,
                          splashColor: Colors.red,


                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {

                            if(formkey.currentState.validate()){
                              registerNewUserr(context);
                            }



                          },
                          child: Text('Submit', style: TextStyle(
                              color: Colors.white),)
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
 decsion(){
    var physical=kdata1.text +kdata2.text;
     print(physical);

}
  var longtiud= "",latitude="";
  void registerNewUserr(BuildContext context) async{
    var physical = int.parse(data16) + int.parse(data17) + int.parse(data18) + int.parse(data19) + int.parse(data20) + int.parse(data21) + int.parse(data22) ;
    var natural = int.parse(data24) + int.parse(data25) +  int.parse(data27);
    var social = int.parse(data29) + int.parse(data30) + int.parse(data31);
    var livehood = int.parse(data32) + int.parse(data33) + int.parse(data34) + int.parse(data35) + int.parse(data36);
    var income = int.parse(data37) + int.parse(data38) + int.parse(data39);
    var expense = int.parse(data42) + int.parse(data43) + int.parse(data44) + int.parse(data45) + int.parse(data46) + int.parse(data47);
    var capital = physical + natural + social;
    var total_point_value = capital + livehood;
    var monitory = income - expense;


    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // var lastPostion = await Geolocator().getLastKnownPosition();
    setState((){
      latitude = '${position.latitude}';
      longtiud =  '${position.longitude}';
    });



    var el;
    if(int.parse(kdata5.text) <= total_point_value && int.parse(kdata6.text) <= monitory){

      el =  "Eligible For Solar Tv";

    }else{
      el = "NoT Eligible For Solar Tv";
    }



    if(int.parse(kdata5.text) <= total_point_value && int.parse(kdata6.text) <= monitory){


      Map <String,dynamic> data= {
        "data1":data1,
        "data2":data2,
        "data3":data3,
        "data4":data4,
        "data5":data5,
        "data6":data6,
        "data7":data7,
        "data8":data8,
        "data9":data9,
        "data10":data10,
        "data11":data11,
        "data12":data12,
        "data13":data13,
        "data14":data14,
        "data15":data15,
        "data16":data16,
        "data17":data17,
        "data18":data18,
        "data19":data19,
        "data20":data20,
        "data21":data21,
        "data22":data22,
        "data23":data23,
        "data24":data24,
        "data25":data25,
        "data26":data26,
        "data27":data27,
        "data28":data28,
        "data29":data29,
        "data30":data30,
        "data31":data31,
        "data32":data32,
        "data33":data33,
        "data34":data34,
        "data35":data35,
        "data36":data36,
        "data37":data37,
        "data38":data38,
        "data39":data39,
        "data40":data40,
        "data41":data41,
        "data42":data42,
        "data43":data43,
        "data44":data44,
        "data45":data45,
        "data46":data46,
        "data47":data47,
        "data48":data48,
        "data49":data49,
        "data50":data50,
        "data51":data51,
        "data52":data52,
        "data53":data53,
        "data54":data54,
        "data55":data55,
        "data56":data56,
        "data57":data57,
        "data58":data58,
        "data59":data59,
        "data60":data60,
        "data61":data61,
        "data62":data62,
        "data63":data63,
        "data64":data64,
        "data65":data65,
        "data66":data66,
        "data67":data67,
        "data68":data68,
        "data69":kdata1.text,
        "data70":kdata2.text,
        "data71":kdata3.text,
        "data72":kdata4.text,
        "data73":total_point_value,
        "data74":monitory,
        "data75":"Eligible For Solar TV",
        "data76":kdata5.text,
        "data77":kdata6.text,
        "data78":kdata7.text,
        "latitude":latitude,
        "longtiud":longtiud,
        "Photo":_image,
        "data80":physical,
        "data81":natural,
        "data82":social,
        "data83":livehood,
        "data84":capital,
        "data85":income,
        "data86":expense




      };


      FirebaseFirestore.instance.collection('EligibleForSolarTv').add(data);
      FirebaseFirestore.instance.collection('AllRecordDataForSolarTv').add(data);
      FirebaseFirestore.instance.collection('EligibleFarmers').add(data);

    }else{

      Map <String,dynamic> data= {
        "data1":data1,
        "data2":data2,
        "data3":data3,
        "data4":data4,
        "data5":data5,
        "data6":data6,
        "data7":data7,
        "data8":data8,
        "data9":data9,
        "data10":data10,
        "data11":data11,
        "data12":data12,
        "data13":data13,
        "data14":data14,
        "data15":data15,
        "data16":data16,
        "data17":data17,
        "data18":data18,
        "data19":data19,
        "data20":data20,
        "data21":data21,
        "data22":data22,
        "data23":data23,
        "data24":data24,
        "data25":data25,
        "data26":data26,
        "data27":data27,
        "data28":data28,
        "data29":data29,
        "data30":data30,
        "data31":data31,
        "data32":data32,
        "data33":data33,
        "data34":data34,
        "data35":data35,
        "data36":data36,
        "data37":data37,
        "data38":data38,
        "data39":data39,
        "data40":data40,
        "data41":data41,
        "data42":data42,
        "data43":data43,
        "data44":data44,
        "data45":data45,
        "data46":data46,
        "data47":data47,
        "data48":data48,
        "data49":data49,
        "data50":data50,
        "data51":data51,
        "data52":data52,
        "data53":data53,
        "data54":data54,
        "data55":data55,
        "data56":data56,
        "data57":data57,
        "data58":data58,
        "data59":data59,
        "data60":data60,
        "data61":data61,
        "data62":data62,
        "data63":data63,
        "data64":data64,
        "data65":data65,
        "data66":data66,
        "data67":data67,
        "data68":data68,
        "data69":kdata1.text,
        "data70":kdata2.text,
        "data71":kdata3.text,
        "data72":kdata4.text,
        "data73":total_point_value,
        "data74":monitory,
        "data75":"Not Eligible For Tv",
        "data76":kdata5.text,
        "data77":kdata6.text,
        "data78":kdata7.text,
        "latitude":latitude,
        "longtiud":longtiud,
        "data80":physical,
        "data81":natural,
        "data82":social,
        "data83":livehood,
        "data84":capital,
        "data85":income,
        "data86":expense



      };


      FirebaseFirestore.instance.collection('NotEligibleForSolarTv').add(data);
      FirebaseFirestore.instance.collection('AllRecordDataForSolarTv').add(data);
      FirebaseFirestore.instance.collection('NotEligibleFarmers').add(data);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
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
            title: Text('Decision Board'),
          ),

          body: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0,top: 20,bottom: 30),
                  child: Image (image: AssetImage('images/suc.jpg'),),
                ),
              ),
              SizedBox(height: 10,),
              Text('${data1} is Successfully Registered',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22,color: Colors.green),
              ),

              Divider(),
              Container(

                width: 330,
                height: 350,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 20.0,top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(width: 2),
                  color: Colors.white54,),

                child: Column(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text('Decision',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black,decoration: TextDecoration.underline,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text('Total Point Value: ${total_point_value}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black,),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text('Monetary Result: ${monitory}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black,),
                      ),
                    ),
                    Padding(



                      padding: const EdgeInsets.only(top: 12),

                      child: Text('${data1} is : ${el}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled4/Fiexed_Nav.dart';
import 'package:untitled4/submit.dart';
import 'capital_physical.dart';
import 'NavBar.dart';
import 'package:easy_localization/easy_localization.dart';
import './translations/codegen_loader.g.dart';
import './translations/locale_keys.g.dart';
import 'Investment_Plan.dart';
import 'package:form_field_validator/form_field_validator.dart';

// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: Household_profile_Registeration_form(),
//     debugShowCheckedModeBanner: false,
//   ));
// }
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
      home: Household_profile_Registeration_form(),
    );
  }
}
// ignore: camel_case_types
class Household_profile_Registeration_form extends StatefulWidget {
  final  String uid;
  final String submit;
  Household_profile_Registeration_form({Key key, @required this.submit, this.uid}): super (key: key);

  @override
  _Household_profile_Registeration_formState createState() =>
      _Household_profile_Registeration_formState(uid,submit);
}

// ignore: camel_case_types
class _Household_profile_Registeration_formState
    extends State<Household_profile_Registeration_form> {

  final String uid;
  final String submit;
  _Household_profile_Registeration_formState(this.uid,this.submit);

  TextEditingController data1 = TextEditingController();
  TextEditingController data2 = TextEditingController();
  TextEditingController data3 = TextEditingController();
  TextEditingController data4 = TextEditingController();
  TextEditingController data5 = TextEditingController();
  TextEditingController data6 = TextEditingController();
  TextEditingController data7 = TextEditingController();
  TextEditingController data8 = TextEditingController();
  TextEditingController data9 = TextEditingController();
  TextEditingController data10 = TextEditingController();
  TextEditingController data11 = TextEditingController();
  TextEditingController data12 = TextEditingController();
  TextEditingController data13 = TextEditingController();
  TextEditingController data14 = TextEditingController();
  TextEditingController data15 = TextEditingController();


  String _value,_valuee ;
  bool is_Streched_DropDown = false ;

  // String title = 'DropDownButton';

  List _MartialStatus = ['ያላገባ', 'ያገባ', 'የሞተበት', 'የፈታ'];

  List _EducationalStatus = ['ከፍተኛ ዲግሪ', 'ሁለተኛ ዲግሪ', 'አንደኛ ዲግሪ', 'ዲፕሎማ','አንደኛ ደረጃ ት/ቤት','ማንበብ ሚችል','ያልተማረ'];



  String _friendsVal;
  String _EduVal ;

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

        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(

                      'Household  Profile Registration Form',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        LocaleKeys.a1.tr(),

                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: data1,

                      decoration: InputDecoration(

                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h1.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),

                    ///Text filed 2
                    Text(
                      LocaleKeys.a2.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextFormField(
                      controller: data2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h2.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      readOnly: true,  //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101)
                        );

                        if(pickedDate != null ){
                          print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                          print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            data2.text = formattedDate; //set output date to TextField value.
                          });
                        }else{
                          print("Date is not selected");
                        }
                      },
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        LocaleKeys.a3.tr(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: "Male",
                          groupValue: _valuee,
                          onChanged: (value) {
                            setState(() {
                              _valuee = value;
                            });
                          },
                        ),
                        Text(

                          LocaleKeys.male2.tr(),
                          style: new TextStyle(fontSize: 17.0),
                        ),
                        Radio(
                          value: "Female",
                          groupValue: _valuee,
                          onChanged: (value) {
                            setState(() {
                              _valuee = value;
                            });
                          },
                        ),
                        Text(
                          LocaleKeys.female2.tr(),
                          style: new TextStyle(fontSize: 17.0),
                        ),
                      ],
                    ),

                    Text(
                      LocaleKeys.a4.tr(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(

                        decoration: BoxDecoration(border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15.0)),

                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: DropdownButton(
                            hint: Text(
                              LocaleKeys.m_status.tr(),
                              style: TextStyle(color: Colors.grey,fontSize: 18),
                            ),
                            dropdownColor: Colors.grey,
                            elevation: 5,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36.0,
                            isExpanded: true,
                            value: _friendsVal,
                            style: TextStyle(color: Colors.black, fontSize: 22.0),
                            onChanged: (value) {
                              setState(() {
                                _friendsVal = value;
                              });
                            },
                            items: _MartialStatus.map((value) {
                              return DropdownMenuItem(
                                child: Text(value),

                                value: value,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        LocaleKeys.a5.tr(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(

                        decoration: BoxDecoration(border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15.0)),

                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: DropdownButton(
                            hint: Text(
                              LocaleKeys.edu_status.tr(),
                              style: TextStyle(color: Colors.grey,fontSize: 18),
                            ),
                            dropdownColor: Colors.grey,
                            elevation: 5,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36.0,
                            isExpanded: true,
                            value: _EduVal,
                            style: TextStyle(color: Colors.black, fontSize: 22.0),
                            onChanged: (valu) {
                              setState(() {
                                _EduVal = valu;
                              });
                            },
                            items: _EducationalStatus.map((valu) {
                              return DropdownMenuItem(
                                child: Text(valu),

                                value: valu,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),


                    Text(
                      LocaleKeys.a6.tr(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),


                    TextFormField(
                      controller: data6,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h6.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),

                    Text(
                      LocaleKeys.a7.tr(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    TextFormField(
                      controller: data7,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h7.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),

                    Text(
                      LocaleKeys.a8.tr(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    TextFormField(
                      controller: data8,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                    Text(
                      LocaleKeys.a9.tr(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextFormField(
                      controller: data9,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h9.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),


                    Text(
                      LocaleKeys.a10.tr(),                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextFormField(
                      controller: data10,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h10.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),

                    Text(
                      LocaleKeys.a11.tr(),                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    TextFormField(
                      controller: data11,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h11.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),

                    Text(
                      LocaleKeys.a12.tr(),                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    TextFormField(
                      controller: data12,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),

                    Text(
                      LocaleKeys.a13.tr(),                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    TextFormField(
                      controller: data13,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h13.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                    Text(
                      LocaleKeys.a14.tr(),                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    TextFormField(
                      controller: data14,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h14.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                    Text(
                      LocaleKeys.a15.tr(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    TextFormField(
                      controller: data15,
                      keyboardType: TextInputType.number,

                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          // borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: LocaleKeys.h15.tr(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      readOnly: true,  //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101)
                        );

                        if(pickedDate != null ){
                          print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                          print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            data15.text = formattedDate; //set output date to TextField value.
                          });
                        }else{
                          print("Date is not selected");
                        }
                      },
                      validator:  RequiredValidator(errorText: "Required*"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          // width: double.infinity,
                          child: FlatButton(
                              color: Colors.blueAccent,
                              splashColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {

                                // if(formkey.currentState.validate()){
                                  registerNewUser(context);
                                // }
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  void registerNewUser(BuildContext context) async{

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return Physical(
          uid:  uid,
          data1:data1.text,
          data2:data2.text,
          data3:_valuee,
          data4:_friendsVal,
          data5:_EduVal,
          data6:data6.text,
          data7:data7.text,
          data8:data8.text,
          data9:data9.text,
          data10:data10.text,
          data11:data11.text,
          data12:data12.text,
          data13:data13.text,
          data14:data14.text,
          data15:data15.text,
        );
      }),
    );

  }

}
displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);
}

String selectMartialStatus = "";
final MartialStatus = TextEditingController();
List<String> martialStatus = [
  "ያገባ,"
      "ላገባ,"
      " የሞተበት, "
      "የፈታ"
];
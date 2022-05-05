import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled4/AdminNav.dart';
// import 'capital_physical.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: SignupAgent(),
    debugShowCheckedModeBanner: false,
  ));
}

DatabaseReference agent = FirebaseDatabase.instance.reference().child("users");

class SignupAgent extends StatefulWidget {
  @override
  _SignupAgentState createState() => _SignupAgentState();
}

class _SignupAgentState extends State<SignupAgent> {

  static const String idScreen = "register";

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController city = TextEditingController();
  String _email,_name,_phone,_password,_city;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin Panel"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Image(
                image:AssetImage('images/log.png'),
                width: 390,
                height: 250.0,
                alignment: Alignment.center,
              ),

              SizedBox(
                height: 40.0,
              ),

              Text(
                "Register For Agent",
                style: TextStyle(fontSize: 24.0,fontFamily: "" ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: name,
                      onChanged: (value){
                        _name=value;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),


                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: email,
                      onChanged: (value){
                        _email=value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),


                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: phone,
                      onChanged: (value){
                        _phone=value;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),



                    SizedBox(
                      height: 1.0,
                    ),


                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: city,
                      onChanged: (value){
                        _city=value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "City",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),



                    TextField(
                      controller: password,
                      onChanged: (value){
                        _password=value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                    SizedBox(height: 20.0,),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text("Sign Up",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: (){
                        if(name.text.length < 3){
                          displayToastMessage("Name must be atleast 3 characters.", context);
                        }
                        else if(!email.text.contains("@")){
                          displayToastMessage("Email address is not Valid", context);
                        }
                        else if(phone.text.isEmpty){
                          displayToastMessage("Phone Number is mandatory", context);
                        }
                        else if(city.text.isEmpty){
                          displayToastMessage("City is Mandatory", context);
                        }
                        else if(password.text.length < 6){
                          displayToastMessage("Password must be 6 characters", context);
                        }
                        else{
                          registerNewUser(context);
                        }

                      },
                    )

                  ],
                ),
              ),

              FlatButton(
                onPressed: (){

                },)


            ],
          ),
        ),
      ),
    );
  }





  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 void registerNewUser(BuildContext context) async{
    final User firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.text, password: password.text).catchError((errMsg){
              displayToastMessage("Error:" + errMsg.toString(), context);
    })).user;
    if(firebaseUser != null)
      {
        agent.child((firebaseUser.uid));

        Map userDataMap = {
          "name": name.text.trim(),
          "email": email.text.trim(),
          "phone": phone.text.trim(),
          "password": password.text.trim(),
          "city": city.text.trim(),
        };

        agent.child(firebaseUser.uid).set(userDataMap);
        displayToastMessage("Congratulation your account has been created", context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return SignupAgent();      //re
          }),
        );
        // Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false)

        //save info in database
      }else
        {
          displayToastMessage("new user account  has not been created", context);
          // error occured
        }
  }

  // void registerNewUser(BuildContext context) async {
  //   UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password,);
  //
  //   if(user!=null)
  //   {
  //
  //     Map <String,dynamic> data={
  //       'FullName':_name,
  //       'MobileNumber':_phone,
  //       'Email':_email,
  //       'password': _password,
  //       'City':_city
  //
  //
  //     };
  //     await FirebaseFirestore.instance.collection('Users').add(data);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) {
  //         return SignupAgent();      //re
  //       }),
  //     );
  //   }
  //   else
  //   {
  //     print('user does not exist');
  //   }
  // }
}
displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);

}
//
// class Rensyslogo extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     AssetImage assetImage = AssetImage('images/logo.png');
//     Image image = Image(image:assetImage, width: 200.0,height: 200.0,);
//     return Container(
//       alignment: Alignment.topCenter,
//       child: image,);
//   }



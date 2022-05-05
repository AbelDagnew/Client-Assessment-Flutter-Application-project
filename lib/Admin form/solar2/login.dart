import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled4/signup.dart';
import 'capital_physical.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Loginn(),
    debugShowCheckedModeBanner: false,
  ));
}
DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("user");
class Loginn extends StatelessWidget {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RENSYS ENGINEERING'),

      ),
      body: SingleChildScrollView(
        child: Container(

            height: 400,
            width: 300,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 70.0,top: 100.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white70,
            ),

          child:Center(

            child: Form(


              child:Column(
                children:<Widget>[
                  new Rensyslogo(),

                  TextField(
                    controller: emailTextEditingController,

                    decoration: InputDecoration(

                        labelText: 'Email'
                    ),
                  ),
                  TextField(
                    controller: passwordTextEditingController,

                    decoration: InputDecoration(

                        labelText: 'Password'
                    ),
                    obscureText: true,
                  ),
                  RaisedButton(

                    onPressed: (){
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
                    color: Colors.blue,
                    child: Text('Login'),
                    textColor: Colors.white,
                  )
                ],
              ),



            ),
          ),
          ),
      ),



    );
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginUser(BuildContext context) async{
  final User firebaseUser = (await _firebaseAuth.signInWithEmailAndPassword(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text
  ).catchError((errMsg){
    displayToastMessage("Error" + errMsg.toString(), context);
  })

  ).user;
  if(firebaseUser != null){
    usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
      if(snap.value != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Physical()));
      }

        else{
        _firebaseAuth.signOut();
        displayToastMessage("No account Existed", context);
        }

    });


}
  else{
    displayToastMessage("Error Occured can not", context);
  }
}
}

class Rensyslogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image image = Image(image:assetImage, width: 200.0,height: 200.0,);
    return Container(
      alignment: Alignment.topCenter,
      child: image,);
  }
}
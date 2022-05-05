import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'capital_physical.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Signup(),
    debugShowCheckedModeBanner: false,
  ));
}

class Signup extends StatelessWidget {
 TextEditingController nameTextEditingController = TextEditingController();
 TextEditingController emailTextEditingController = TextEditingController();
 TextEditingController phoneTextEditingController = TextEditingController();
 TextEditingController passwordTextEditingController = TextEditingController();
 TextEditingController roleTextEditingController = TextEditingController();
 String _email,_password,_name, _phone,_Role,email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RENSYS ENGINEERING'),

      ),
      body: SingleChildScrollView(
        child: Container(

          height: 600,
          width: 300,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(left: 70.0,top: 100.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white70,
          ),

          child:Center(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(


                child:Column(
                  children:<Widget>[
                    new Rensyslogo(),

                    TextField(
                      controller: nameTextEditingController,
                      onChanged: (value){
                        _name=value;
                      },
                      decoration: InputDecoration(

                          labelText: 'Full Name'
                      ),
                    ),
                    TextField(
                    controller: emailTextEditingController,
                      onChanged: (value){
                        _email=value;
                      },
                      decoration: InputDecoration(

                          labelText: 'Email'
                      ),
                    ),
                    TextField(
                      controller: phoneTextEditingController,
                      onChanged: (value){
                        _phone=value;
                      },
                      decoration: InputDecoration(

                          labelText: 'Phone Number'
                      ),
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      onChanged: (value){
                        _password=value;
                      },
                      decoration: InputDecoration(

                          labelText: 'Password'
                      ),
                      obscureText: true,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RaisedButton(

                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24),
                        ),
                        onPressed: (){





                        },
                        color: Colors.blue,
                        child: Text('Login'),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),



              ),
            ),
          ),
        ),
      ),



    );
  }

 void registerNewUser(BuildContext context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
   UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password,);
    email = _email;

   if(user!=null)
   {

     Map <String,dynamic> data={
       'FullName':_name,
       'MobileNumber':_phone,
       'Email':_email,
       'password': _password,
       

     };
     await FirebaseFirestore.instance.collection('Admin').add(data);
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) {
         return Physical();
       }),
     );
   }
   else
   {
     print('user does not exist');
   }
   // UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
   // if (user != null) {
   //   await FirebaseFirestore.instance.collection('agent').doc(_email).set({
   //     'FullName':_name,
   //     'MobileNumber':_phone,
   //     'Email':_email,
   //     'password': _password,
   //   });
   //
   //   Navigator.push(
   //     context,
   //     MaterialPageRoute(builder: (context) {
   //       return Physical();
   //     }),
   //   );
   // }
   // else {
   //   print('user does not exist');
   // }
 }
}
displayToastMessage(String message, BuildContext context){
  Fluttertoast.showToast(msg: message);

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
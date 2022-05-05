import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Icon(Icons.arrow_back),
        title: Text('About Us'),
        backgroundColor: Colors.blue,
      ),
      body: Container(

        child: ListView(

          padding: EdgeInsets.only(top: 20),
            children: [
              Container(
                child: ListTile(
                    leading: ClipOval(
                      child: Image(image: AssetImage(
                        'image/logo.jpg',
                      ),
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  title: Text('ሬንሲስ ኢንጂነሪንግ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  subtitle: Text('RENSYS ENGINEERING Version 1.0'),
                ),
              ),
              Divider(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left:20,top: 20),
                  child: ListTile(
                    leading: Icon(Icons.email, size: 50, color: Colors.grey,),
                    title: Text('info@rensysengineering.com',  style: TextStyle(color: Colors.blueAccent,fontSize: 26),),

                  ),
                ),
              ),
              Divider(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left:20,top: 20),
                  child: ListTile(
                    leading: Icon(Icons.phone, size: 50, color: Colors.grey,),
                    title: Text('+251952494949',  style: TextStyle(color: Colors.blueAccent,fontSize: 26),),

                  ),
                ),
              ),


            ],
        ),

      ),


    );
  }
}


import 'dart:io';



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
body: Center(
  child: _image == null ? Text("No Image") : Image.file(_image),
),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        backgroundColor: Colors.blue,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}


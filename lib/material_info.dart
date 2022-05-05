import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';
import 'package:untitled4/before_form.dart';
import 'package:untitled4/translations/codegen_loader.g.dart';
import 'package:untitled4/Household.dart';
import 'NavBar.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
void main() {
  runApp(MaterialApp(
    home: MaterialInfo(),
    debugShowCheckedModeBanner: false,
  ));
}
class MaterialInfo extends StatefulWidget {



  @override
  _MaterialInfoState createState() => _MaterialInfoState();
}

class _MaterialInfoState extends State<MaterialInfo> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    home: Scaffold(
    drawer: NavBar(),
    appBar: AppBar(
    title: Text(
    'Material Information',
    style: const TextStyle(
    color: Colors.white,

    fontWeight: FontWeight.bold,
    fontSize: 18,

    ),),
    centerTitle: true,
    ),
    body: Container(
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.blue,

      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: PinchZoomImage(
                image: Image.asset('images/i3.jpg'),
                zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
                hideStatusBarWhileZooming: true,
                onZoomStart: () {
                  print('Zoom started');
                },
                onZoomEnd: () {
                  print('Zoom finished');
                },

              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Container(
                child: PinchZoomImage(
                  image: Image.asset('images/i1.jpg'),
                  zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
                  hideStatusBarWhileZooming: true,
                  onZoomStart: () {
                    print('Zoom started');
                  },
                  onZoomEnd: () {
                    print('Zoom finished');
                  },

                ),

              ),
            ),
            Container(
              child: PinchZoomImage(
                image: Image.asset('images/i2.jpg'),
                zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
                hideStatusBarWhileZooming: true,
                onZoomStart: () {
                  print('Zoom started');
                },
                onZoomEnd: () {
                  print('Zoom finished');
                },

              ),

            ),
          ],
        ),

      ),
    ),
    ),
    );

    }
    }

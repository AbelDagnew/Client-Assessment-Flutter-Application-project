import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/solar/Household.dart';
import 'package:untitled4/translations/codegen_loader.g.dart';
import 'package:untitled4/before_form.dart';
import 'NavBar.dart';
import 'package:untitled4/Household.dart';
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
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  final List<String> imageList = [
    'images/s1.jpg',
    'images/s2.jpg',
    'images/s3.jpg',
    'images/s4.jpg',


];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            'Home',
              style: const TextStyle(
              color: Colors.white,

              fontWeight: FontWeight.bold,
              fontSize: 28,

          ),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(

            decoration:  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.blue,
                image:  DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'images/bg2.png',
                  ),

                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Rensys Product's",
                    style: const TextStyle(
                      color: Colors.deepOrangeAccent,

                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  Container(
                    width: 450,
                    height: 250,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.all(15),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),


                    ),
                    child: CarouselSlider(
                      options:CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                      ),
                      items: imageList.map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Opacity(
                              opacity: 0.9,
                              child: Image.asset(e,
                              width: 1000,
                              height: 200,
                              fit:BoxFit.cover,
                            ),
                            ),

                          ],
                        ),
                      )).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 450,
                      height: 305,
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 10),
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.elliptical(2, 5)),
                          color: Colors.indigo,

                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                              child:Text(
                                "Mission",
                                style: const TextStyle(

                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left:45,top: 8,right: 25),
                              child: Text(
                                "Our mission is to provide clean, sus tain able and affordable renewable solution (for lighting, water pumpin g, irrigation, village electrification, Productive Use of Energy, PUE) for the off-grid sector of Ethiopia.",
                                style: const TextStyle(
                                    color: Colors.white,

                                    fontSize: 21,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 320,
                        height: 50,
                        child: FlatButton(
                            color: Colors.deepOrange,
                            splashColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return BeforeSubmit();
                                }),
                              );
                            },
                            child: Text(
                              'Register Form',
                              style: TextStyle(color: Colors.white,fontSize: 30),

                            )),
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
}

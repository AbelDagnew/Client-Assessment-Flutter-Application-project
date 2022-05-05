import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Map(),
    debugShowCheckedModeBanner: false,
  ));
}
class Map extends StatefulWidget {
  final latitude,longtiud,agent;
  Map({Key key, @required this.latitude,this.longtiud,this.agent}): super (key: key);

  @override
  _MapState createState() => _MapState(latitude,longtiud,agent);
}

class _MapState extends State<Map> {
  final latitude,longtiud,agent;

  _MapState( this.latitude, this.longtiud,this.agent);
  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'),
            position: LatLng(double.parse(latitude),double.parse(longtiud)),
            infoWindow: InfoWindow(
              snippet: "Registered By",
            title: agent
        ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registered Location"),
      ),
      body: GoogleMap(
        onMapCreated:_onMapCreated ,
        markers: _markers,
        initialCameraPosition: CameraPosition(

          target: LatLng(double.parse(latitude),double.parse(longtiud)),
          zoom: 17,
        ),
      ),
    );
  }
}

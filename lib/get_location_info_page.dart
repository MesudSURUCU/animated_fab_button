import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationInfoPage extends StatefulWidget {
  const GetLocationInfoPage({super.key});

  @override
  State<GetLocationInfoPage> createState() => _GetLocationInfoPageState();
}

class _GetLocationInfoPageState extends State<GetLocationInfoPage> {
double enlem = 0.0;
double boylam = 0.0;
Future<void> getLocationInfo() async {
var konum = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

setState(() {
enlem = konum.latitude;
boylam = konum.longitude;  
});


}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
             Text("Enlem : $enlem", style:const TextStyle(),),
             Text("Boylam : $boylam ", style:const TextStyle(),),
            ElevatedButton(onPressed: (){
              getLocationInfo();
            }, 
            child:const Text("Konum bilgisi al"))
          ],
        ),
      ),
    );
  }
}
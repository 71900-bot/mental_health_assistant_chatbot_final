import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health_chatbot/Screens/GetHelp/get_help.dart';
import 'package:mental_health_chatbot/constants.dart';

// Create a medical helplines screen for the app to provide the suggested helplines
class MedicalHelplinesScreen extends StatefulWidget {
  final String info;
  const MedicalHelplinesScreen({Key? key, required this.info}) : super(key: key);
  @override
  _MedicalHelplinesScreenState createState() => _MedicalHelplinesScreenState();
}

// Hold the state of the MedicalHelplinesScreen widget
class _MedicalHelplinesScreenState extends State<MedicalHelplinesScreen> {
  MapController mapController = MapController();
  Marker? userMarker;
  List<dynamic> helplines = [];


  Future<void> getUserLocationAndHelplines() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (kDebugMode) {
        print('Location services are disabled.');
      }
      return;
    }

    // Check for permission to access location
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (kDebugMode) {
          print('Location permissions are denied.');
        }
        return;
      }
    }

    // Get user's current location
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      userMarker = Marker(
        point: LatLng(position.latitude, position.longitude),
        builder: (ctx) => const Icon(
          Icons.location_on,
          color: Colors.blue,
        ),
      );
      mapController.move(LatLng(position.latitude, position.longitude), 13);
    });

    // Get the helplines data from a JSON file using the `http` package
    final response = await http.get(Uri.parse(
        'http://192.168.43.74/mental_health_assistant_chatbot/GetHelp/mentalHelplines.json'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> allHelplines = jsonData['helplines'];

// Sort the helplines by distance in ascending order
      allHelplines.sort((a, b) {
        double distanceA = Geolocator.distanceBetween(
          a['latitude'].toDouble(),
          a['longitude'].toDouble(),
          position.latitude,
          position.longitude,
        );
        double distanceB = Geolocator.distanceBetween(
          b['latitude'].toDouble(),
          b['longitude'].toDouble(),
          position.latitude,
          position.longitude,
        );
        return distanceA.compareTo(distanceB);
      });
// Get the three most recent helplines
      final recentHelplines = allHelplines.take(3).toList();

      setState(() {
        helplines = recentHelplines;
      });
    } else {
      // Handle error
      if (kDebugMode) {
        print('Error getting helplines: ${response.statusCode}');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Call the function to get user's location and helplines data
    getUserLocationAndHelplines();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Assistant Chatbot'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: LatLng(3.1390, 101.6869),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(
                    markers: [
                      if (userMarker != null) userMarker!,
                      for (var i = 0; i < 3; i++)
                        if (helplines.length > i)
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(
                              helplines[i]['latitude'],
                              helplines[i]['longitude'],
                            ),
                            builder: (ctx) => const Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            const Text(
              "The Most Recent Medical Helplines",
              style: TextStyle(fontSize: 20, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding / 2),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  if (helplines.length > index) {
                    return ListTile(
                      title: Text(helplines[index]['name']),
                      subtitle: Text(helplines[index]['phone']+"\n"+helplines[index]['website']),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            SizedBox(
              width: 250,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>GetHelpScreen(info: widget.info),
                    ),
                  );
                },
                child: Text("Go Back".toUpperCase(), textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomAppBar(
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Icon(
                  Icons.email,
                ),
              ),
              Text(" ${widget.info}",
                  style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
              )
            ],
          ),
        ),
    ),
    );
  }
}
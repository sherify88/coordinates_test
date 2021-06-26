import 'package:coordinates_test/model/model_test.dart';
import 'package:coordinates_test/screens/map_screen_test.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => ModelTest(),child:MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreenTest(),
    ) ,)   ;
  }
}

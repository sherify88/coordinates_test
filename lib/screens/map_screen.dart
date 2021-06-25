import 'package:coordinates_test/model/model_voom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markerList = [];

  // var jsonData;
  var model = ModelVoom();

  Future<void> getMapList() async {
    var api = await http.get(
      Uri.parse("https://hatley-app.000webhostapp.com/testapi.php"),
    );
    var jsonData = json.decode(api.body);
    setState(() {
      var latValue = double.parse(jsonData["lat"]);
      var lngValue = double.parse(jsonData["lng"]);
      var pinTitle = jsonData["store_name"];
      var pinSnippet = jsonData["area_name"];

      markerList = [
        Marker(
          position: LatLng(latValue, lngValue),
          markerId: MarkerId("02"),
          infoWindow: InfoWindow(
            title: pinTitle,
            snippet: pinSnippet,
          ),
          onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Place Info'),
                  content: Container(
                    height: 300.0, // Change as per your requirement
                    width: 300.0, // Change as per your requirement
                    child: model.itemListValue == null
                        ?Center(child:CircularProgressIndicator() ,)
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.itemListValue.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(model.itemListKey[index]+
                                    ": ${model.itemListValue[index]}")
                              );
                            },
                          ),
                  ),
                );
              }),
        ),
      ];
    });
  }

  var isInit = true;
  var isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      model = Provider.of<ModelVoom>(context);

      model.fetchBranchsData();
        setState(() {
          isLoading = false;
        });

    }
    isInit = false;

    super.didChangeDependencies();
  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Gujarat, India'),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    getMapList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps Test"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(30.033333, 31.233334),
          //  LatLng(latValue is String? 22:latValue  , lngValue is String? 22:latValue ),
          zoom: 6,
        ),
        markers: Set.of(markerList),
      ),
    );
  }
}

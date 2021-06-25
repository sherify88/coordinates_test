import 'package:coordinates_test/model/model_testing_voom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class MapScreenTest extends StatelessWidget {
  List<Marker> markerList = [];

  var model = ModelTest();

  @override
  Widget build(BuildContext context) {
    model = Provider.of<ModelTest>(context);

    model.fetchDataAndGetItemList();

    void showMarkerDialoge(ModelTest point) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return model.points == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : AlertDialog(
                    title: Text(point.time),
                    content: Container(
                      height: 300.0, // Change as per your requirement
                      width: 300.0, // Change as per your requirement
                      child: point.itemListValue == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: point.itemListValue.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(point.itemListKey[index] +
                                      ": ${point.itemListValue[index]}"),
                                );
                              },
                            ),
                    ),
                  );
          });
    }

    void getMapList() {
      for (var point in model.points) {
        markerList.add(
          Marker(
              position:
                  LatLng(double.parse(point.lat), double.parse(point.lng)),
              markerId: MarkerId(point.time),
              infoWindow: InfoWindow(
                title: point.itemListValue[0],
                snippet: point.itemListValue[1],
              ),
              onTap: () => showMarkerDialoge(point)),
        );
      }
    }

    getMapList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps Test"),
      ),
      body: model.itemListValue == null || model.itemListValue.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(31.205753, 29.924526),
                zoom: 15,
              ),
              markers: model.itemListValue == null ? {} : Set.of(markerList),
            ),
    );
  }
}

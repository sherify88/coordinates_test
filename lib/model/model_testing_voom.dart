import 'dart:convert';
import 'package:coordinates_test/json_file_for_test/json_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ModelTestingVoom with ChangeNotifier {}

class ModelTest with ChangeNotifier {
  final merchant_name;
  final payment;
  final store_area;
  final notes;
  final store_name;
  final client_name;
  final phone_number;
  final address;
  final area_name;
  final category;

  ModelTest(
      {this.merchant_name,
      this.payment,
      this.store_area,
      this.notes,
      this.store_name,
      this.client_name,
      this.phone_number,
      this.address,
      this.area_name,
      this.category,
      this.time,
      this.sign,
      this.special_place,
      this.freezer,
      this.online_payment,
      this.masary,
      this.fawry,
      this.aman,
      this.lat,
      this.lng,
      this.itemListKey,
      this.itemListValue});

  final time;
  final sign;
  final special_place;
  final freezer;
  final online_payment;
  final masary;
  final fawry;
  final aman;
  final lat;
  final lng;
  var itemListKey;
  var itemListValue;
  var pointsList;

  final extractedData = JsonTest.TEST_LARGE_JSON_DATA;

  List<ModelTest> get points {
    return [...pointsList];
  }

  void fetchDataAndGetItemList() {

    List<ModelTest> modelTestList = [];
    extractedData.forEach((element) {
      itemListKey = [];
      itemListValue = [];
      itemListKey.addAll(element.keys);
      itemListValue.addAll(element.values);

      modelTestList.add(
        ModelTest(
          merchant_name: element["merchant_name"],
          payment: element["payment"],
          store_area: element["store_area"],
          notes: element["notes"],
          store_name: element["store_name"],
          client_name: element["client_name"],
          phone_number: element["phone_number"],
          address: element["address"],
          area_name: element["area_name"],
          category: element["category"],
          time: element["time"],
          sign: element["sign"],
          special_place: element["special_place"],
          freezer: element["freezer"],
          online_payment: element["online_payment"],
          masary: element["masary"],
          fawry: element["fawry"],
          aman: element["aman"],
          lat: element["lat"],
          lng: element["lng"],
          itemListKey: itemListKey,
          itemListValue: itemListValue,
        ),
      );
    });
    pointsList = modelTestList;

    notifyListeners();

  }
}

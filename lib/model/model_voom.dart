import 'package:flutter/material.dart';
import 'package:coordinates_test/screens/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'dart:convert';

class ModelVoom with ChangeNotifier {
  var  merchant_name;
  var  payment;
  var  store_area;
  var  notes;
  var  store_name;
  var  client_name;
  var  phone_number;
  var  address;
  var  area_name;
  var  category;

  ModelVoom({ this.merchant_name,
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
     this.lng,this.itemListKey,this.itemListValue,});

  var  time;
  var  sign;
  var  special_place;
  var  freezer;
  var  online_payment;
  var  masary;
  var  fawry;
  var  aman;
  var  lat;
  var  lng;
  var itemListKey;
  var itemListValue;


  ModelVoom.plain();
  Future<void> fetchBranchsData() async {
    var url = Uri.parse("https://hatley-app.000webhostapp.com/testapi.php");
    List<String> jsonItemListKey=[];
    
    List<String> jsonItemListValue=[];
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) {
        return;
      }

      extractedData.forEach((prodId, prodData) {
       // jsonItemMap.add({prodId:prodData});
        jsonItemListKey.add(prodId);
        jsonItemListValue.add(prodData);
        prodId=="merchant_name"? merchant_name= prodData:"";
        prodId=="payment"? payment= prodData:"";
        prodId=="store_area"? store_area= prodData:"";
        prodId=="notes"? notes= prodData:"";
        prodId=="store_name"? store_name= prodData:"";
        prodId=="client_name"? client_name= prodData:"";
        prodId=="phone_number"? phone_number= prodData:"";
        prodId=="address"? address= prodData:"";
        prodId=="area_name"? area_name= prodData:"";
        prodId=="category"? category= prodData:"";
        prodId=="time"? time= prodData:"";
        prodId=="sign"? sign= prodData:"";
        prodId=="special_place"? special_place= prodData:"";
        prodId=="freezer"? freezer= prodData:"";
        prodId=="online_payment"? online_payment= prodData:"";
        prodId=="masary"?masary= prodData:"";
        prodId=="fawry"?fawry= prodData:"";
        prodId=="aman"?aman= prodData:"";
        prodId=="lat"? lat= prodData:"";
        prodId=="lng"? lng= prodData:"";

      });

      itemListKey=jsonItemListKey;
      itemListValue=jsonItemListValue;
      print(jsonItemListValue);

      notifyListeners();

    } catch (error) {
      print(error);
      throw error;
    }
  }

}


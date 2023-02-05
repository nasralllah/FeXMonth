import 'dart:convert';

import 'package:flutter/services.dart' as rootbundul;
import 'package:http/http.dart' as http;

class products{
  int? id;
  String? name;
  String? catagory;
  String? ImageUrl;
  String? price;
  String? albumID;

  products(
      {this.id,
      this.name,
      this.catagory,
      this.ImageUrl,
      this.price,
      this.albumID
      });

  products.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    albumID = json['albumId'];
    name = json['nametitle'];
    ImageUrl = json['image'];

  }
}
/*
Future<List<products>>Readjasondata()async {

  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Bearer 22|Fj8UYSP2BdJDKYhMNtM5qZdlmTGzca75JTDMSwue'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://10.0.2.2:8000/api/register'));


}*/





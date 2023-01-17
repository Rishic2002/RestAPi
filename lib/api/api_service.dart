// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:resthttp/constants.dart';
import 'package:resthttp/model/user_model.dart';


class Api {
  Future<List<UserModel>?> getUsers() async {      //get users from api ( here used pubic api)
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);  
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}



/*

const String baseUrl = 'https://631c37911b470e0e12fcdd0b.mockapi.io/api';

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': '',
      'api_key': '',
    };

    var response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  //POST
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Authorization': '',
      'Content-Type': 'application/json',
      'api_key': '',
    };

    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  //PUT 
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Authorization': '',
      'Content-Type': 'application/json',
      'api_key': '',
    };

    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
  //DELETE
  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Authorization': '',
      'api_key': '',
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}*/
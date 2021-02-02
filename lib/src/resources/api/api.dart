import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hr_management/src/resources/api/api_exception.dart';

const String host = 'raw.githubusercontent.com';
const Duration timeOut = const Duration(seconds: 10);

class API {
  API._();

  static API _instance = API._();

  factory API() => _instance;

  Future<dynamic> makeRequest(RequestMethod method, String path) async {
    http.Response response;

    Uri endpoint = Uri.https(host, path);

    try {
      switch (method) {
        case RequestMethod.Get:
          response = await http.get(endpoint).timeout(timeOut);
          break;
      }
    } on TimeoutException catch (ex) {
      throw ApiException(
        description: "Don't get response in ${ex.duration.inSeconds}s",
        endpoint: endpoint,
        error: 'Time out',
        statusCode: 408,
      );
    }
    final decodedBody = json.decode(response.body);
    //Check if the request was succesfully
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw ApiException(
        description: "Don't get response",
        endpoint: endpoint,
        error: 'No response!',
        statusCode: response.statusCode,
      );
    }
    //Return respone
    return decodedBody;
  }
}

//This app only use Get
enum RequestMethod { Get }

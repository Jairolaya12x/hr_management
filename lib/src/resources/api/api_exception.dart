import 'package:flutter/foundation.dart';

class ApiException implements Exception {
  Uri endpoint;
  String error;
  String description;
  int statusCode;
  ApiException({
    @required this.description,
    @required this.endpoint,
    @required this.error,
    @required this.statusCode,
  });
} 
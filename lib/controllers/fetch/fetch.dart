import 'dart:convert';

import 'package:http/http.dart' as http;

Map<String, String> Headers = {
  'Content-Type': 'application/json',
  "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods": "POST, OPTIONS"
};

Future<dynamic> Get (String url, {Map<String, String> headers, void then(dynamic response), void error(dynamic message)}) async {
  dynamic response;
  
  try {
    response = await http.get(
      Uri.parse(url),
      headers: (headers != null) ? headers : Headers,
    );

    if (then != null) {
      then(response);
    }
  } catch (e) {
    if (error != null) {
      error(e);
    }
  }

  return response;

}

Future<dynamic> Post (String url, Map<String, dynamic> body, {Map<String, String> headers, void then(dynamic response), void error(dynamic message)}) async {
  dynamic response;
  
  try {
    response = await http.post(
      Uri.parse(url),
      headers: (headers != null) ? headers : Headers,
      body: jsonEncode((body != null) ? body : {}),
      encoding: Encoding.getByName('utf-8')
    );

    if (then != null) {
      then(response);
    }
  } catch (e) {
    if (error != null) {
      error(e);
    }
  }

  return response;
}

Future<dynamic> Put (String url, Map<String, dynamic> body, {Map<String, String> headers, void then(dynamic response), void error(dynamic message)}) async {
  dynamic response;
  
  try {
    response = await http.put(
      Uri.parse(url),
      headers: (headers != null) ? headers : Headers,
      body: jsonEncode((body != null) ? body : {}),
      encoding: Encoding.getByName('utf-8')
    );

    if (then != null) {
      then(response);
    }
  } catch (e) {
    if (error != null) {
      error(e);
    }
  }

  return response;
}
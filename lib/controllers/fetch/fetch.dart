import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> Get (String url, {Map<String, String> headers, void then(dynamic response), void error(dynamic message)}) async {
  dynamic response;
  
  try {
    response = await http.get(
      Uri.parse(url),
      headers: (headers != null) ? headers : {'Content-Type': 'application/json'},
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
      headers: (headers != null) ? headers : {'Content-Type': 'application/json'},
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
      headers: (headers != null) ? headers : {'Content-Type': 'application/json'},
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
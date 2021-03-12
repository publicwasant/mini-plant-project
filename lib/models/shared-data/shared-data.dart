import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> _prep_shared () async {
  dynamic prefs;

  try {
    prefs = await SharedPreferences.getInstance();
  } catch (e) {
    SharedPreferences.setMockInitialValues({});
    return _prep_shared();
  }

  return prefs;
}

Future<dynamic> Read (String key, {Function then}) async {
  final prefs = await _prep_shared();
  dynamic value = prefs.get(key);

  try {
    value = jsonDecode(value);
  } catch (e) {}

  if (then != null) {
    then(value);
  }

  return value;
}

Future<dynamic> Write (String key, dynamic value, {Function then}) async {
  final prefs = await _prep_shared();

  switch (value.runtimeType.toString()) {
    case 'bool':
      prefs.setBool(key, value);
      break;
    case 'double':
      prefs.setDouble(key, value);
      break;
    case 'int':
      prefs.setInt(key, value);
      break;
    case 'String':
      prefs.setString(key, value);
      break;
    default:
      String unknow;

      try {
        unknow = jsonEncode(value);
        prefs.setString(key, unknow);
      } catch (e) {}
  }

  if (then != null) {
    then();
  }
}
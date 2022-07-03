import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class DictionaryApiFreeHelper {
  final String _url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';

  DictionaryApiFreeHelper._();

  static final DictionaryApiFreeHelper _helper = DictionaryApiFreeHelper._();

  factory DictionaryApiFreeHelper() {
    return _helper;
  }

  Future<Map<String, dynamic>> getRequest(String word) async {
    // print(_url + word);
    var response = await http.get(Uri.parse('$_url$word'));
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body)[0];
    } else {
      print(response.request);
      throw Exception((e) => debugPrint(e.toString()));
    }
  }
}

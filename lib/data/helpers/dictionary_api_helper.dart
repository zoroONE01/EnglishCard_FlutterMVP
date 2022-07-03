import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class DictionaryApiHelper {
  final String _appId = '752918d8';
  final String _appKey = '2c460e32a7fe26df94c27287d8a84bcf';
  final String _lang = 'en-us';
  final String _url =
      'https://od-api.oxforddictionaries.com:443/api/v2/entries';

  DictionaryApiHelper._();

  static final DictionaryApiHelper _helper = DictionaryApiHelper._();

  factory DictionaryApiHelper() {
    return _helper;
  }

  Future<Map<String, dynamic>> getRequest(String word) async {
    // print(_url + word);
    Map<String, String> header = {'app_id': _appId, 'app_key': _appKey};
    var response =
        await http.get(headers: header, Uri.parse('$_url/$_lang/$word'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('loi o day $response.statusCode');
      throw Exception((e) => debugPrint(e.toString()));
    }
  }
}

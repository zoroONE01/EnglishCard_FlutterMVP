import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/expect.dart';

class RandomWordApiHelper {
  final String _appId = 'random-words5.p.rapidapi.com';
  final String _appKey = '280a7101e7msh7940b04984d0f5bp1a5619jsnbe233ae30332';
  final String _url = 'www.random-words5.p.rapidapi.com/getMultipleRandom';

  RandomWordApiHelper();

  Future<List<String>> getRequest(int count) async {
    Map<String, String> header = {
      'X-RapidAPI-Host': _appId,
      'X-RapidAPI-Key': _appKey
    };
    final queryParameters = {
      'count': '$count',
    };
    final uri = Uri(
        scheme: 'https',
        host: 'random-words5.p.rapidapi.com',
        path: '/getMultipleRandom',
        queryParameters: queryParameters);
    var response = await http.get(headers: header, uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List;
      return json.map((e) => e.toString()).toList();
    } else {
      // print(response.statusCode);
      throw Exception((e) => prints(e.toString()));
    }
  }
}

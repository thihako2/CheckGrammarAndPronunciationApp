import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:mmengstrain/Logic/Constants/Grammar/GrammarConstants.dart';
import 'package:mmengstrain/Logic/models/GrammarModel.dart';

class GrammarProvider {
  final Dio _dio = Dio();
  final url = GramConst.url;

  Future<GrammarModel> fetchGrammarCheck(String text) async {
    print("Here");
    print(url);
    print(text);
    var params = {
      "lang": GramConst.lang,
      "apiKey": GramConst.apiKey,
      "clientVersion": GramConst.apiVersion,
      "text": text,
    };
    try {
      Response response = await _dio.get(url, queryParameters: params);
      // var response = await http.get(
      //   Uri.https(url, path, params),
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      // );
      // var data = jsonDecode(response.body);
      print(response.data);
      return GrammarModel.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stacktrace: $stacktrace");
      }
      return GrammarModel();
    }
  }
}

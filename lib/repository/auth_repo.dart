import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tamyez/model/faq_model.dart';
import 'package:http/http.dart' as http;
import 'package:tamyez/network/ServicesURLs.dart';

class AuthRepository {
  static Future<List<FaqModel>> getFaq(BuildContext context) async {
    final response = await http.get(Uri.parse(ServicesURLs.url));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print("$parsed");
      return parsed.map<FaqModel>((json) => FaqModel.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load faq');
    }
  }
}

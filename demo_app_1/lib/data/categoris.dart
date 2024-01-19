import 'dart:convert';

import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:http/http.dart' as http;

class CategoriesCourse {
  Future<List<DataCategoriesModel>> fetchData() async {
    final response = await http.get(
        Uri.parse('https://65a4e6d952f07a8b4a3de5b9.mockapi.io/api/categories'),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List body = json.decode(response.body);
      return body.map((e) => DataCategoriesModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

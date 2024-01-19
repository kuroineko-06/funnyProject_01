import 'dart:convert'; // Use for JSON decoding
import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:http/http.dart' as http;

class DetailCourse {
  final String baseUrl =
      "https://65a4e6d952f07a8b4a3de5b9.mockapi.io/api/categories";
  Future<DataCategoriesModel> getDetailById(id) async {
    final response = await http.get(
        Uri.parse(
            "https://65a4e6d952f07a8b4a3de5b9.mockapi.io/api/categories/${id}"),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      return DataCategoriesModel(
          id: body['id'],
          CourseName: body['CourseName'],
          SubjectArea: body['SubjectArea'],
          SkillLevel: body['SkillLevel'],
          TrainingProgram: body['TrainingProgram'],
          CertificationType: body['CertificationType'],
          ImageURL: body['ImageURL'],
          Content: body['Content'],
          Price: body['Price'],
          Duration: body['Duration'],
          VideoURL: body['VideoURL']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

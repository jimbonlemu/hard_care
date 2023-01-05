import 'dart:convert';
import 'package:health_care_pt2/app/data/models/faq_model.dart';
import 'package:http/http.dart' as http;

class RepoFAQ {
  final _baseUrl =
      'https://healthcare.wstif3b-bws.id/api/getFaq.php';

  Future getData() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Faq> album = it.map((e) => Faq.fromJson(e)).toList();
        return album;
      }
    } catch (e) {}
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../jadwal_model.dart';

class RepoJadwal {
  final _baseUrl =
      'https://edda-2404-8000-102e-46f5-b044-5942-6c34-94f0.ap.ngrok.io/hc/api/jadwal.php';

  Future getData() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
      );
      // print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<JadwalApi> jadwal_api = [];
        for (var jadwal in data) {
          jadwal_api.add(JadwalApi(
              id: jadwal['id'],
              nama: jadwal['nama'],
              no_str: jadwal['no_str'],
              jadwal_mulai: jadwal['jadwal_mulai'],
              jadwal_selesai: jadwal['jadwal_selesai']));
        }
        return jadwal_api;
      }
    } catch (e) {}
  }
}
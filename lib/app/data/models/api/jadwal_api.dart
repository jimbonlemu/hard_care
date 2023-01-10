import 'dart:convert';
import 'package:http/http.dart' as http;
import '../jadwal_model.dart';

class RepoJadwal {
  final _baseUrl = 'https://healthcare.wstif3b-bws.id/api/getJadwal.php';

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

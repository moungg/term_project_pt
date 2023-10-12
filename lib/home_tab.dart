import 'package:http/http.dart' as http;

class ApiService {
  Future fetchData() async {
    final response = await http.get(Uri.parse(
        'http://localhost:8000/api/https://example.com/api/users/')); // Django 서버 주소와 API 엔드포인트를 지정하세요
    if (response.statusCode == 200) {
      // JSON 데이터를 파싱하고 처리하세요
      print('Response data: ${response.body}');
      return response.body; // 또는 파싱된 데이터를 반환
    } else {
      throw Exception('Failed to load data');
    }
  }
}

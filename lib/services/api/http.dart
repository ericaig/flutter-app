import 'package:flutter_app/services/api/routes.dart';
import 'package:http/http.dart' as http;

class ApiService {
  void addMissingHeaders() {}

  post(String endpoint, dynamic body) async {
    var client = http.Client();

    print('==============URL==============');
    print(ApiRoutes.domain + '' + endpoint);
    print(body);
    print('==============URL==============');

    return await client.post(ApiRoutes.domain + '' + endpoint, body: body);
  }
}

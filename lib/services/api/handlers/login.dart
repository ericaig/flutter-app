import 'package:flutter_app/services/api/http.dart';
import 'package:flutter_app/services/api/routes.dart';

class LoginApiService {
  login({String username, String password}) async {
    final api = new ApiService();

    final response = await api
        .post(ApiRoutes.login, {'username': username, 'password': '1234'});
    print('Response status: ${response.statusCode}');
    print(response.body);
    // print('Response body: ${response.body}');
  }
}

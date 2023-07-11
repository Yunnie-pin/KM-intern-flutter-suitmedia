import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_intern_flutter_application_mobile/model/user_list.dart';

class ApiService {
  static const String _baseUrl = 'https://reqres.in/api/users?';
  static const int _perPage = 10;

  Future<UserList> getUserList(http.Client client, int page) async {
    final response = await client.get(Uri.parse('$_baseUrl' 'page=$page&per_page=$_perPage'));
    if (response.statusCode == 200) {
      return UserList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user list');
    }
  }
}

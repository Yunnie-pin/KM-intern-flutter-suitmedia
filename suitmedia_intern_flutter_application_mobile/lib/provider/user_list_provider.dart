import 'dart:io';

import 'package:flutter/material.dart';
import 'package:suitmedia_intern_flutter_application_mobile/api/api_list_user.dart';
import 'package:suitmedia_intern_flutter_application_mobile/model/user_list.dart';
import 'package:suitmedia_intern_flutter_application_mobile/utility/result_state.dart';
import 'package:http/http.dart' as http;

class UserListProvider extends ChangeNotifier {
  final ApiService apiService;
  final int page;

  UserListProvider({required this.apiService, required this.page}) {
    _fetchUserList(page);
  }

  late UserList _userListStatus;
  late ResultState _state;
  String _message = '';

  UserList get list => _userListStatus;
  ResultState get state => _state;
  String get message => _message;

  Future _fetchUserList(page) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final userList = await apiService.getUserList(http.Client(), page);
      if (userList.data.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _userListStatus = userList;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Internet Connection';
    } on HttpException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Couldn't find the post";
    } on FormatException {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Bad response format";
    }
  }
}

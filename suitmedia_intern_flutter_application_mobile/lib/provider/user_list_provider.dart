import 'dart:io';

import 'package:flutter/material.dart';
import 'package:suitmedia_intern_flutter_application_mobile/api/api_list_user.dart';
import 'package:suitmedia_intern_flutter_application_mobile/model/user_list.dart';
import 'package:suitmedia_intern_flutter_application_mobile/utility/result_state.dart';
import 'package:http/http.dart' as http;

class UserListProvider extends ChangeNotifier {
  final ApiService apiService;
  final int page;
  final ScrollController scrollController = ScrollController();
  final Duration delay =
      const Duration(seconds: 2); // Delay waktu (dalam detik)

  UserListProvider({required this.apiService, required this.page}) {
    _fetchUserList(page);
    _addScrollListener();
  }

  late UserList _userListStatus;
  late UserList _oldUserListStatus;
  late ResultState _state;
  String _message = '';
  bool _isLastPage = false;
  bool _isLoadingNextPage =
      false; // Penanda apakah sedang memuat halaman berikutnya

  UserList get list => _userListStatus;
  UserList get oldList => _oldUserListStatus;
  ResultState get state => _state;
  String get message => _message;
  bool get isLastPage => _isLastPage;

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

        if (userList.page == userList.totalPages) {
          _isLastPage = true;
        } else {
          _isLastPage = false;
        }
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

  Future<void> refreshData() async {
    await _fetchUserList(1);
  }

  Future<void> _loadNextPage() async {
    if (!_isLastPage && _state != ResultState.loading && !_isLoadingNextPage) {
      _isLoadingNextPage = true;
      notifyListeners();

      await Future.delayed(delay); // Delay sebelum memuat halaman berikutnya

      await _fetchUserList(page + 1);

      _isLoadingNextPage = false;
      notifyListeners();
    }
  }

  void _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !_isLastPage) {
        _loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

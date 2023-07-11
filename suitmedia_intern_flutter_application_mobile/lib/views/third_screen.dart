import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_intern_flutter_application_mobile/api/api_list_user.dart';
import 'package:suitmedia_intern_flutter_application_mobile/provider/user_list_provider.dart';
import 'package:suitmedia_intern_flutter_application_mobile/utility/result_state.dart';

import '../widget/card_user_views.dart';

class ThirdScreenViews extends StatelessWidget {
  const ThirdScreenViews({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserListProvider(apiService: ApiService(), page: 1),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black12,
              height: 2.0,
            ),
          ),
          title: const Text(
            'Third Screen',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Consumer<UserListProvider>(builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: state.list.data.length,
              itemBuilder: (context, index) {
                return cardUserViews(context, state, index);
              },
            );
          } else if (state.state == ResultState.noData) {
            return const Center(child: Text('No Data User'));
          } else if (state.state == ResultState.error) {
            return const Center(child: Text('Error'));
          } else {
            return const Center(child: Text(''));
          }
        }),
      ),
    );
  }
}

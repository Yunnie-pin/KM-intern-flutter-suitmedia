import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_intern_flutter_application_mobile/api/api_list_user.dart';
import 'package:suitmedia_intern_flutter_application_mobile/provider/user_list_provider.dart';
import 'package:suitmedia_intern_flutter_application_mobile/utility/result_state.dart';

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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/second',
                              arguments:
                                  '${state.list.data[index].firstName} ${state.list.data[index].lastName}');
                        },
                        child: Card(
                            color: Colors.white,
                            elevation: 0,
                            borderOnForeground: true,
                            margin: const EdgeInsets.all(10),
                            shape: ShapeBorder.lerp(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                1),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(90.0),
                                      child: Image.network(
                                        state.list.data[index].avatar,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${state.list.data[index].firstName} ${state.list.data[index].lastName}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          state.list.data[index].email,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black45),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])),
                      ),
                      const Divider(
                        color: Colors.black12,
                        thickness: 1.0,
                      )
                    ],
                  ),
                );
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

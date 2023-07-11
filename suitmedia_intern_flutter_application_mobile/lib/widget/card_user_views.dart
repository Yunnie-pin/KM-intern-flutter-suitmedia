import 'package:flutter/material.dart';

import '../provider/user_list_provider.dart';

Widget cardUserViews(BuildContext context, UserListProvider state, int index) {
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
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${state.list.data[index].firstName} ${state.list.data[index].lastName}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
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
        ),
        if ((state.list.page < state.list.totalPages) &
            (index == state.list.perPage - 1)) ...[
          const Center(child: CircularProgressIndicator()),
        ],
      ],
    ),
  );
}

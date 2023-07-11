import 'package:flutter/material.dart';

class ThirdScreenViews extends StatelessWidget {
  const ThirdScreenViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/second',
                    arguments: 'First Name');
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
                              'https://reqres.in/img/faces/1-image.jpg',
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'First Name',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Email@email.com',
                                style: TextStyle(
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
      ),
    );
  }
}

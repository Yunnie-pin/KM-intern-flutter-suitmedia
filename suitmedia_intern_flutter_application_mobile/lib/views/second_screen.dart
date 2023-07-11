import 'package:flutter/material.dart';

class SecondScreenViews extends StatelessWidget {
  final String userName;
  const SecondScreenViews({super.key, required this.userName});

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
          'Second Screen',
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
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            Text(
              userName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 31, 63, 112),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
          child: const Text(
            'Choose a User',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

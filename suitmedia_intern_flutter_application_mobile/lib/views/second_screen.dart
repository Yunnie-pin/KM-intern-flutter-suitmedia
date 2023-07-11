import 'package:flutter/material.dart';

class SecondScreenViews extends StatelessWidget {
  final String userName;
  const SecondScreenViews({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Value: $userName'),
    );
  }
}

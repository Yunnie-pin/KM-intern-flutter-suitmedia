import 'package:flutter/material.dart';
import 'views/first_screen.dart';
import 'views/second_screen.dart';
import 'views/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suitmedia Intern Flutter Application Mobile',
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(43, 99, 123, 1)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreenViews(),
        '/second': (context) => SecondScreenViews(
            userName: ModalRoute.of(context)?.settings.arguments as String),
        '/third': (context) => const ThirdScreenViews(),
      },
    );
  }
}

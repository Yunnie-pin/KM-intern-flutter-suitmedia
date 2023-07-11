import 'package:flutter/material.dart';

class FirstScreenViews extends StatefulWidget {
  const FirstScreenViews({Key? key}) : super(key: key);

  @override
  State<FirstScreenViews> createState() => _FirstScreenViewsState();
}

class _FirstScreenViewsState extends State<FirstScreenViews> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();
  bool? isPalindrome;

  @override
  void dispose() {
    _palindromeController.dispose();
    super.dispose();
  }

  void _checkPalindrome(String text) {
    String value = _palindromeController.text;
    value = value.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');

    String reversedValue = String.fromCharCodes(value.runes.toList().reversed);

    setState(() {
      isPalindrome = value == reversedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 101, 122, 245),
          Color.fromARGB(255, 87, 93, 131)
        ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black26,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Icon(
                      Icons.group_add_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.only(
                        left: 16, right: 16, top: 12, bottom: 12),
                    hintText: 'Name',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _palindromeController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.only(
                        left: 16, right: 16, top: 12, bottom: 12),
                    hintText: 'Palindrome',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    isDense: true,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                if (isPalindrome != null)
                  Text(
                    isPalindrome! ? 'Palindrome' : 'Bukan Palindrome',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 63, 112),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    _checkPalindrome(_palindromeController.text);
                  },
                  child: const Text(
                    'Check',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 63, 112),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second',
                        arguments: _nameController.text);
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

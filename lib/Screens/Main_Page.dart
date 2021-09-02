import 'package:flutter/material.dart';

// ignore: unused_import
import 'Home_Page.dart';
// ignore: unused_import
import 'Tab_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SliderPage(),
      ],
    ));
  }
}

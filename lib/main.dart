import 'package:flutter/material.dart';

import 'ui/home/view/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multicamp App',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

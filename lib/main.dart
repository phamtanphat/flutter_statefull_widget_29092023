import 'package:flutter/material.dart';
import 'package:flutter_statefull_widget_29092023/demo_build_context_page.dart';
import 'package:flutter_statefull_widget_29092023/my_home_page.dart';
import 'package:flutter_statefull_widget_29092023/to_do_list_page.dart';

import 'demo_key_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoBuildContextPage()
    );
  }
}
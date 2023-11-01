import 'package:flutter/material.dart';

class DemoKeyAndBuildContextPage extends StatefulWidget {
  const DemoKeyAndBuildContextPage({super.key});

  @override
  State<DemoKeyAndBuildContextPage> createState() => _DemoKeyAndBuildContextPageState();
}

class _DemoKeyAndBuildContextPageState extends State<DemoKeyAndBuildContextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo key and build context page"),
      ),
      body: Container(

      ),
    );
  }
}

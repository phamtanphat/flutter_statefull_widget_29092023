import 'package:flutter/material.dart';

class DemoBuildContextPage extends StatefulWidget {
  const DemoBuildContextPage({super.key});

  @override
  State<DemoBuildContextPage> createState() => _DemoBuildContextPageState();
}

class _DemoBuildContextPageState extends State<DemoBuildContextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo build context"),
      ),
      body: Container(),
    );
  }
}

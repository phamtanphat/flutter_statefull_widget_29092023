import 'package:flutter/material.dart';
import 'package:flutter_statefull_widget_29092023/main.dart';

class DemoBuildContextPage extends StatefulWidget {
  int number = 20;

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
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ChameWidget(
          child: Concai(),
        ),
      ),
    );
  }
}

class ChameWidget extends StatefulWidget {
  String label = "Cha me";
  Widget child;

  ChameWidget({required this.child});

  @override
  State<ChameWidget> createState() => _ChameWidgetState();
}

class _ChameWidgetState extends State<ChameWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Cha me widget"),
        widget.child
      ],
    );
  }
}

class Concai extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DemoBuildContextPage? page = context.findAncestorWidgetOfExactType();
    ChameWidget? chameWidget = context.findAncestorWidgetOfExactType();
    return Container(
      child: Text("Con cai ${page?.number} ${chameWidget?.label}"),
    );
  }
}


import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My home page"),
      ),
      body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Count: 0", style: TextStyle(color: Colors.red, fontSize: 30)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () { }, child: Text("Increase")),
                    ElevatedButton(onPressed: () { }, child: Text("Decrease")),
                    ElevatedButton(onPressed: () { }, child: Text("Reset")),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

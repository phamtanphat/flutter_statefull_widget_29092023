import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void setCount(int value) {
    setState(() {
      count = value == 0 ? value : count + value;
    });
  }

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
                Text("Count: $count", style: TextStyle(color: Colors.red, fontSize: 30)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {
                      setCount(1);
                    }, child: Text("Increase")),
                    ElevatedButton(onPressed: () {
                      setCount(-1);
                    }, child: Text("Decrease")),
                    ElevatedButton(onPressed: () {
                      setCount(0);
                    }, child: Text("Reset")),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

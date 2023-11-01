import 'dart:math';

import 'package:flutter/material.dart';

class DemoKeyPage extends StatefulWidget {
  const DemoKeyPage({super.key});

  @override
  State<DemoKeyPage> createState() =>
      _DemoKeyPageState();
}

class _DemoKeyPageState extends State<DemoKeyPage> {
  var listTile = <Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Title(GlobalKey()),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Title(GlobalKey()),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo key and build context page"),
      ),
      body: Center(
        child: Row(
          children:
              listTile, // Row nhận một list Widget nên mình truyền listTile vào
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTwoTileWidget,
        // thực hiện hoán đổi vị trí 2 Widget trong listTile
        child: Icon(Icons.swap_horiz),
      ),
    );
  }

  // hàm thực hiện hoán đổi 2 Widget trong listTile
  void swapTwoTileWidget() {
    setState(() {
      listTile.insert(1, listTile.removeAt(0)); // (*)
    });
  }
}

class Title extends StatefulWidget {
  Title(Key key) : super(key: key);

  @override
  State<Title> createState() => _TitleState();
}

class _TitleState extends State<Title> {
  final Color color = generateRandomColor();

  // mỗi object sẽ có 1 random Color không thể thay đổi
  @override
  Widget build(BuildContext context) {
    // tạm hiểu Container như cái thùng có màu sắc, kích thước => khá giống viên gạch =))
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}

// hàm tạo ra một Color bất kỳ
Color generateRandomColor() {
  // biến random sẽ giúp ta tạo ra 1 số ngẫu nhiên
  final Random random = Random();

  // Màu sắc được tạo nên từ RGB, là một số ngẫu nhiên từ 0 -> 255 và opacity = 1
  return Color.fromRGBO(
      random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
}

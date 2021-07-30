import 'package:flutter/material.dart';
import 'package:global_key/random_color.dart';

class StatelessKeyPage extends StatefulWidget {
  StatelessKeyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatelessKeyPageState();
}

class _StatelessKeyPageState extends State<StatelessKeyPage> {
  var _tiles = [
    _StatelessKeyItem(),
    _StatelessKeyItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swipe),
        onPressed: swapTiles,
      ),
    );
  }

  void swapTiles() {
    setState(() {
      _tiles.insert(1, _tiles.removeAt(0));
    });
  }
}

class _StatelessKeyItem extends StatelessWidget {
  _StatelessKeyItem({Key? key}) : super(key: key);

  final myColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: Padding(padding: EdgeInsets.all(70.0)),
    );
  }
}

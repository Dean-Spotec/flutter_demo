import 'package:flutter/material.dart';
import 'package:global_key/random_color.dart';

class StatefulKeyPage extends StatefulWidget {
  StatefulKeyPage({
    Key? key,
    required this.useKey,
  }) : super(key: key);

  final bool useKey;

  @override
  State<StatefulWidget> createState() => _StatefulKeyPageState();
}

class _StatefulKeyPageState extends State<StatefulKeyPage> {
  late List<_StatelfulKeyItem> _tiles;

  @override
  void initState() {
    super.initState();
    _tiles = [
      _StatelfulKeyItem(key: widget.useKey ? UniqueKey() : null),
      _StatelfulKeyItem(key: widget.useKey ? UniqueKey() : null),
    ];
  }

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

class _StatelfulKeyItem extends StatefulWidget {
  _StatelfulKeyItem({Key? key}) : super(key: key);

  @override
  __StatelfulKeyItemState createState() => __StatelfulKeyItemState();
}

class __StatelfulKeyItemState extends State<_StatelfulKeyItem> {
  final myColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: Padding(padding: EdgeInsets.all(70.0)),
    );
  }
}

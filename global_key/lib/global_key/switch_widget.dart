import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({
    Key? key,
    required this.child,
    required this.isGlobal,
  }) : super(key: key);

  final Widget child;
  final bool isGlobal;

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  final _childKey = GlobalKey();
  var showBackground = false;

  @override
  Widget build(BuildContext context) {
    final child = widget.isGlobal
        // 给child的父widget添加globalKey，在reparent的时候保存child的state
        // https://api.flutter.dev/flutter/widgets/GlobalKey-class.html
        ? KeyedSubtree(
            key: _childKey,
            child: widget.child,
          )
        // 这种情况每次switch，child都会重建新的state
        : widget.child;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  showBackground = !showBackground;
                });
              },
              child: Text('Global Switch'),
            ),
            // 修改child组件在widget树中的位置
            showBackground
                ? Container(
                    color: Colors.red,
                    child: child,
                  )
                : child,
          ],
        ),
      ),
    );
  }
}

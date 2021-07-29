import 'package:flutter/material.dart';

class GlobalSwitchWidget extends StatefulWidget {
  const GlobalSwitchWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _GlobalSwitchWidgetState createState() => _GlobalSwitchWidgetState();
}

class _GlobalSwitchWidgetState extends State<GlobalSwitchWidget> {
  final _childKey = GlobalKey();
  var showBackground = false;

  @override
  Widget build(BuildContext context) {
    final child = KeyedSubtree(
      key: _childKey,
      child: widget.child,
    );
    return Scaffold(
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

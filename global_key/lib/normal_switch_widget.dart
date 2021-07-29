import 'package:flutter/material.dart';

class NormalSwitchWidget extends StatefulWidget {
  const NormalSwitchWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _NormalSwitchWidgetState createState() => _NormalSwitchWidgetState();
}

class _NormalSwitchWidgetState extends State<NormalSwitchWidget> {
  var showBackground = false;

  @override
  Widget build(BuildContext context) {
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
              child: Text('Normal Switch'),
            ),
            showBackground
                ? Container(
                    color: Colors.red,
                    child: widget.child,
                  )
                : widget.child,
          ],
        ),
      ),
    );
  }
}

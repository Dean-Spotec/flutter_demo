import 'package:flutter/widgets.dart';

class ChildWidget extends StatefulWidget {
  ChildWidget({Key? key}) : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  void initState() {
    super.initState();
    print('ChildWidget Init');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('ChildWidget Deactivate');
  }

  @override
  Widget build(BuildContext context) {
    print('ChildWidget Build');
    return Text('child widget');
  }
}

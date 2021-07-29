import 'package:flutter/material.dart';
import 'package:global_key/child_widget.dart';

import 'global_switch_widget.dart';
import 'normal_switch_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = ChildWidget();
    return Scaffold(
      body: ListView(
        children: [
          PushListItem(
            title: 'Normal Switch',
            pushedPage: NormalSwitchWidget(
              child: child,
            ),
          ),
          PushListItem(
            title: 'Global Switch',
            pushedPage: GlobalSwitchWidget(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class PushListItem extends StatelessWidget {
  const PushListItem({
    Key? key,
    required this.title,
    this.pushedPage,
  }) : super(key: key);

  final String title;
  final Widget? pushedPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: pushedPage == null
          ? null
          : () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return pushedPage!;
              }));
            },
    );
  }
}

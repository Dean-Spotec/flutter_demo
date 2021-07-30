import 'package:flutter/material.dart';

import 'global_key/child_widget.dart';
import 'global_key/switch_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = ChildWidget();
    return Scaffold(
      body: ListView(
        children: [
          _PushListItem(
            title: 'Normal Switch',
            pushedPage: SwitchWidget(
              child: child,
              isGlobal: false,
            ),
          ),
          _PushListItem(
            title: 'Global Switch',
            pushedPage: SwitchWidget(
              child: child,
              isGlobal: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _PushListItem extends StatelessWidget {
  const _PushListItem({
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

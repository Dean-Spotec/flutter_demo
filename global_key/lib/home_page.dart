import 'package:flutter/material.dart';
import 'package:global_key/local_key/stateless_key_page.dart';

import 'global_key/child_widget.dart';
import 'global_key/switch_page.dart';
import 'local_key/stateful_key_page.dart';

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
            pushedPage: SwitchPage(
              child: child,
              isGlobal: false,
            ),
          ),
          _PushListItem(
            title: 'Global Switch',
            pushedPage: SwitchPage(
              child: child,
              isGlobal: true,
            ),
          ),
          _PushListItem(
            title: 'Stateless without key',
            pushedPage: StatelessKeyPage(),
          ),
          _PushListItem(
            title: 'Stateful without key',
            pushedPage: StatefulKeyPage(useKey: false),
          ),
          _PushListItem(
            title: 'Stateful with key',
            pushedPage: StatefulKeyPage(useKey: true),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/score.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('UnDo'),
            onTap: () {
              Provider.of<Score>(context, listen: false).rollback();
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Reset'),
            onTap: () {
              Provider.of<Score>(context, listen: false).reset();
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}

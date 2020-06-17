import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ExpansionTilePage extends StatelessWidget {
  static const routeName = '/expansion-tile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionTile'),
      ),
      body: [
        Container(
          color: Colors.lime[100],
          child: const ExpansionTile(
            title: Text('Section A'),
            children: [
              ListTile(
                title: Text('Item 1'),
              ),
              ListTile(
                title: Text('Item 2'),
              ),
              ListTile(
                title: Text('Item 3'),
              ),
              ListTile(
                title: Text('Item 4'),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ExpansionTile(
          title: Text('Section B'),
          subtitle: Text('subtitle').textColor(Colors.orange),
          initiallyExpanded: true,
          backgroundColor: Colors.grey[200],
          children: [
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
            ListTile(
              title: Text('Item 3'),
            ),
            ListTile(
              title: Text('Item 4'),
            )
          ],
        )
      ].toColumn(),
    );
  }
}

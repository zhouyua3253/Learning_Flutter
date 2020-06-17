import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ReOrderListPage extends StatefulWidget {
  static const routeName = '/reorder-list';

  @override
  _ReorderListPageState createState() => _ReorderListPageState();
}

class _ReorderListPageState extends State<ReOrderListPage> {
  List<int> _items = List.generate(50, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _items
        .map((e) => DecoratedBox(
              key: ValueKey('item $e'),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey[300]))),
              child: ListTile(
                title: Text('item $e'),
                subtitle: Text('subtitle $e'),
                leading: CircleAvatar(
                  child: Text('$e'),
                  backgroundColor: Colors.orange,
                ),
                trailing: const Icon(Icons.dehaze),
              ),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ReorderableList'),
      ),
      body: ReorderableListView(
        children: children,
        onReorder: _onReorder,
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    print('oldIndex -> $oldIndex, newIndex -> $newIndex');

    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }

      final int removedItem = _items.removeAt(oldIndex);
      _items.insert(newIndex, removedItem);
    });
  }
}

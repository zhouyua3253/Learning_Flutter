import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ChipPage extends StatefulWidget {
  static const routeName = '/chip';

  @override
  _ChipPageState createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chip'),
      ),
      body: [
        const RawChip(
            label: Text('RawChip'),
            labelPadding: EdgeInsets.symmetric(horizontal: 30),
            avatar: Icon(Icons.add_location)),
        const RawChip(
          label: Text('RawChip disable'),
          isEnabled: false,
        ),
        const Chip(
          label: Text('chip'),
        ),
        Container(
          color: Colors.lime,
          child: Chip(
              label: const Text('MaterialTapTargetSize.shrinkWrap'),
              backgroundColor: Colors.cyan,
              labelStyle: const TextStyle(fontSize: 16, color: Colors.indigo),
              avatar: const Icon(
                Icons.account_circle,
                color: Colors.orange,
              ),
              elevation: 5,
              shadowColor: Colors.red,
              deleteIcon: const Icon(Icons.clear),
              onDeleted: () => print('Chip onDeleted1'),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4)),
        ),
        Container(
          color: Colors.grey[300],
          child: Chip(
              label: const Text('MaterialTapTargetSize.padded'),
              backgroundColor: Colors.cyan,
              labelStyle: const TextStyle(fontSize: 20, color: Colors.indigo),
              avatar: const Icon(
                Icons.account_circle,
                color: Colors.orange,
              ),
              elevation: 5,
              shadowColor: Colors.red,
              deleteIcon: const Icon(Icons.delete_outline),
              deleteIconColor: Colors.pink,
              onDeleted: () => print('Chip onDeleted2'),
              materialTapTargetSize: MaterialTapTargetSize.padded),
        ),
        const Divider(),
        ActionChip(
          avatar: const Icon(Icons.opacity),
          label: const Text('ActionChip'),
          onPressed: () => print('ActionChip'),
          elevation: 5,
          pressElevation: 10,
        ),
        const Divider(),
        Wrap(
          spacing: 10,
          children: [
            ...List.generate(
                8,
                (index) => ChoiceChip(
                      label: Text('ChoiceChip-$index'),
                      selected: index == _selectedIndex,
                      selectedColor: Colors.orange,
                      backgroundColor: Colors.grey[200],
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        }
                      },
                    )),
            const ChoiceChip(label: Text('ChoiceChip disabled'), selected: false)
          ],
        ),
        const Divider(),
        Wrap(
          spacing: 10,
          children: List.generate(
              8,
              (index) => FilterChip(
                    label: Text('FilterChip-$index'),
                    selected: index == _selectedIndex,
                    checkmarkColor: Colors.deepOrange,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      }
                    },
                  )).toList(),
        )
      ].toColumn().scrollable().constrained(width: double.infinity, height: double.infinity),
    );
  }
}

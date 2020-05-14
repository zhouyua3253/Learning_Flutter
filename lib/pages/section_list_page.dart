import 'package:group_list_view/group_list_view.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class SectionData {
  SectionData({@required this.title, @required this.items});

  final String title;
  final List<String> items;
}

final List<SectionData> kSections = [
  SectionData(title: 'A', items: ['aa', 'aaa', 'aaaa']),
  SectionData(title: 'B', items: ['bb', 'bbb', 'bb']),
  SectionData(title: 'C', items: ['cc', 'ccc', 'cccc']),
  SectionData(title: 'D', items: ['dd', 'ddd', 'dddd']),
  SectionData(title: 'E', items: ['ee', 'eee', 'eeee']),
];

class SectionListPage extends StatelessWidget {
  static const routeName = '/section-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SectionList'),
      ),
      body: SafeArea(
        child: GroupListView(
          padding: const EdgeInsets.all(16),
          sectionsCount: kSections.length,
          countOfItemInSection: (int section) => kSections[section].items.length,
          groupHeaderBuilder: (
            BuildContext context,
            int section,
          ) =>
              Text(kSections[section].title)
                  .fontSize(20)
                  .fontWeight(FontWeight.bold)
                  .constrained(height: 40),
          itemBuilder: (
            BuildContext context,
            IndexPath index,
          ) {
            return Container(
              child: Text(kSections[index.section].items[index.index]),
              alignment: Alignment.center,
              color: Colors.white,
              height: 80,
              margin: const EdgeInsets.only(bottom: 20),
            ).card();
          },
        ),
      ),
    );
  }
}

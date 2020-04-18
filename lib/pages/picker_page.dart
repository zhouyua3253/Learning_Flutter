import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class PickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picker'),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button(
              padding: EdgeInsets.all(15),
              color: Colors.orange,
              child: Text('Cupertino datetime picker'),
              onPressed: () {
                _showCupertinoDatePicker(context);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              padding: EdgeInsets.all(15),
              color: Colors.orange,
              child: Text('Material datetime picker'),
              onPressed: () => _showDatePicker(context),
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              padding: EdgeInsets.all(15),
              color: Colors.orange,
              child: Text('Material time picker'),
              onPressed: () => _showTimePicker(context),
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              padding: EdgeInsets.all(15),
              color: Colors.orange,
              child: Text('Custom Cupertino picker'),
              onPressed: () => _showCustomCupertinoPicker(context),
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              padding: EdgeInsets.all(15),
              color: Colors.orange,
              child: Text('Custom Material picker'),
              onPressed: () => _showCustomMaterialPicker(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showCupertinoDatePicker(BuildContext context) {
    EdgeInsets windowPadding = MediaQuery.of(context).padding;

    CupertinoDatePicker picker = CupertinoDatePicker(
      mode: CupertinoDatePickerMode.dateAndTime,
      use24hFormat: true,
      onDateTimeChanged: _onDateTimeChange,
    );

    Widget node = Container(
      height: 216 + windowPadding.bottom,
      color: Colors.white,
      padding: EdgeInsets.only(bottom: windowPadding.bottom),
      child: picker,
    );

    // showCupertinoModalPopup(context: context, builder: (_) => node);
    showModalBottomSheet(context: context, builder: (_) => node);
  }

  void _showDatePicker(BuildContext context) async {
    DateTime today = DateTime.now();
    DateTime firstDate = today.add(Duration(days: -10));
    DateTime lastDate = today.add(Duration(days: 30));

    DateTime date = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: firstDate, lastDate: lastDate);
    print("Material date $date");
  }

  void _showTimePicker(BuildContext context) async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

      /// Show a dialog with time unconditionally displayed in 24 hour format.
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    print("Material time $time");
  }

  void _onDateTimeChange(DateTime value) {
    print(value);
  }

  void _showCustomCupertinoPicker(BuildContext context) {
    EdgeInsets windowPadding = MediaQuery.of(context).padding;

    Container picker = Container(
        padding: EdgeInsets.only(bottom: windowPadding.bottom),
        height: 216 + windowPadding.bottom,
        color: Colors.white,
//      child: CupertinoPicker(
//        backgroundColor: Colors.white,
//        itemExtent: 40,
//        onSelectedItemChanged: (value) {
//          print("onSelectedItemChanged -> ${value}");
//        },
//        children: <Widget>[
//          Center(
//            child: Text('Option 1'),
//          ),
//          Center(
//            child: Text('Option 2'),
//          ),
//          Center(
//            child: Text('Option 3'),
//          )
//        ],
//      ),
        child: CupertinoPicker.builder(
            backgroundColor: Colors.white,
            itemExtent: 40,
            childCount: 100,
            onSelectedItemChanged: (value) {
              print("onSelectedItemChanged -> $value");
            },
            itemBuilder: (_, index) => Center(
                  child: Text("option ${index + 1}"),
                )));

    // showCupertinoModalPopup(context: context, builder: (_) => picker);
    showModalBottomSheet(context: context, builder: (_) => picker);
  }

  void _showCustomMaterialPicker(BuildContext context) {
    SimpleDialog dialog = SimpleDialog(title: Text('Please choose one option!'), children: [
      ListTile(
        title: Text("option 1"),
        contentPadding: EdgeInsets.symmetric(horizontal: 30),
        onTap: () {
          print('click option 1');
        },
      ),
      ListTile(
        title: Text("option 2"),
        contentPadding: EdgeInsets.symmetric(horizontal: 30),
        onTap: () {
          print('click option 2');
        },
      ),
      ListTile(
        title: Text("option 3"),
        contentPadding: EdgeInsets.symmetric(horizontal: 30),
        onTap: () {
          print('click option 3');
        },
      ),
      ListTile(
        title: Text("option 4"),
        contentPadding: EdgeInsets.symmetric(horizontal: 30),
        onTap: () {
          print('click option 4');
        },
      )
    ]);

    showDialog(context: context, builder: (_) => dialog);
  }
}

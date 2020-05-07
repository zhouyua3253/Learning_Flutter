import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderPage extends StatelessWidget {
  static const routeName = '/form-builder';
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final allCountries = ['CHINA', 'SWEDEN', 'USA'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FormBuilder Example"),
        ),
        body: FormBuilder(
          child: [
            FormBuilderFilterChip(
              attribute: 'filter_chip',
              decoration: InputDecoration(
                labelText: 'Select many options',
              ),
              options: [
                FormBuilderFieldOption(value: 'Test 1', child: Text('Test 1')),
                FormBuilderFieldOption(value: 'Test 2', child: Text('Test 2')),
                FormBuilderFieldOption(value: 'Test 3', child: Text('Test 3')),
                FormBuilderFieldOption(value: 'Test 4', child: Text('Test 4')),
              ],
            ),
            FormBuilderChoiceChip(
              attribute: 'choice_chip',
              decoration: InputDecoration(
                labelText: 'Select an option',
              ),
              options: [
                FormBuilderFieldOption(value: 'Test 1', child: Text('Test 1')),
                FormBuilderFieldOption(value: 'Test 2', child: Text('Test 2')),
                FormBuilderFieldOption(value: 'Test 3', child: Text('Test 3')),
                FormBuilderFieldOption(value: 'Test 4', child: Text('Test 4')),
              ],
            ),
            FormBuilderCustomField(
              attribute: "name",
              validators: [
                FormBuilderValidators.required(),
              ],
              initialValue: "Argentina",
              formField: FormField(
                enabled: true,
                builder: (FormFieldState<dynamic> field) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Select option",
                      contentPadding: EdgeInsets.only(top: 10.0, bottom: 0.0),
                      border: InputBorder.none,
                      errorText: field.errorText,
                    ),
                    child: Container(
                      height: 200,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        children: allCountries.map((c) => Text(c)).toList(),
                        onSelectedItemChanged: (index) {
                          print(index);
                          field.didChange(allCountries[index]);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ].toColumn(),
        ).padding(all: 16));
  }
}

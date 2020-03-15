import 'package:flutter/material.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

/// https://flutter.dev/docs/cookbook/forms/validation
class FormValidationPage extends StatefulWidget {
  @override
  _FormValidationPageState createState() => _FormValidationPageState();
}

class _FormValidationPageState extends State<FormValidationPage> {
  /// pass a [GlobalKey] to TextFormField and use [GlobalKey.currentState] to validate, save or reset the form field.
  /// final GlobalKey _textFieldFormKey = GlobalKey<FormState>();
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _pwdInputController = TextEditingController();
  final FocusNode _nameInputFocus = FocusNode();
  final FocusNode _pwdInputFocus = FocusNode();

  @override
  void dispose() {
    _nameInputController.dispose();
    _pwdInputController.dispose();
    _nameInputFocus.dispose();
    _pwdInputFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
        elevation: 0,
      ),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: GestureDetector(
            onTap: _dismissKeyboard,
            child: Form(
              /// key: _textFieldFormKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _nameInputController,
                    focusNode: _nameInputFocus,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: "What's your name?",
                    ),
                    validator: (value) {
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Must have uppercase letters';
                      }
                      if (!value.contains(RegExp(r'[a-z]'))) {
                        return 'Must have lowercase letters';
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'Must have number';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _pwdInputController,
                    focusNode: _pwdInputFocus,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'longer than 6 digitals.',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return value.length > 6 ? null : '长度必须大于6位';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Builder(
                    builder: (context) => Button(
                      padding: EdgeInsets.all(10),
                      child: Text('VERIFY FORM'),
                      onPressed: () => _verifyForm(context),
                    ),
                  )),
                  Center(
                      child: Builder(
                    builder: (context) => Button(
                      padding: EdgeInsets.all(10),
                      child: Text('RESET FORM'),
                      onPressed: () => _resetAllTheForm(context),
                    ),
                  )),
                ],
              ),
            ),
          )),
    );
  }

  /// context from Builder() function
  void _verifyForm(BuildContext context) {
    /// Get FormState from GlobalKey
    /// bool isValid = (_textFieldFormKey.currentState as FormState).validate();

    /// Get FormState from Builder context
    bool isValid = Form.of(context).validate();
    print("VERIFY FORM: $isValid");

    if (isValid) {
      SnackBar snackbar = SnackBar(
        content: Text("Name -> ${_nameInputController.text}, pwd -> ${_pwdInputController.text}"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  /// context from Builder() function
  void _resetAllTheForm(BuildContext context) {
    Form.of(context).reset();
  }

  void _dismissKeyboard() {
    if (_nameInputFocus.hasFocus) {
      _nameInputFocus.unfocus();
    }
    if (_pwdInputFocus.hasFocus) {
      _pwdInputFocus.unfocus();
    }
  }
}

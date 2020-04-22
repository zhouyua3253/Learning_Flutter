import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/customWidget/button.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState_focusNode
    super.initState();

    // 监听焦点变化
    _focusNode.addListener(() {
      print('监听焦点变化 -> ${_focusNode.hasFocus}');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: ListView(children: [
          Container(
            color: Colors.grey[200],
            child: TextField(
              // autofocus: true,
              maxLines: 2,
              decoration: InputDecoration(
                  hintText: 'Max Lines = 2, contentPadding = 0', contentPadding: EdgeInsets.zero),
            ),
          ),
          Divider(),
          Container(
            color: Colors.grey[200],
            child: TextField(
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                hintText: "action button = go",
              ),
            ),
          ),
          Divider(),
          Container(
            color: Colors.grey[200],
            child: TextField(
              decoration: InputDecoration(
                  labelText: "With icon",
                  hintText: "What's your name",
                  icon: Icon(
                    Icons.account_circle,
                    size: 40,
                  )),
            ),
          ),
          Divider(),
          Container(
            color: Colors.grey[200],
            child: TextField(
                decoration: InputDecoration(
                    labelText: "With prefixIcon",
                    hintText: "What's your name",
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    helperText: 'Helper text',
                    counterText: 'Counter Text')),
          ),
          Divider(),
          Container(
            color: Colors.grey[200],
            child: TextField(
                maxLength: 30,
                decoration: InputDecoration(
                  labelText: "With prefixIcon",
                  hintText: "What's your name",
                  prefixIcon: Icon(
                    Icons.account_circle,
                    size: 30,
                  ),
                  errorText: 'Please input your name',
                )),
          ),
          Divider(),
          Container(
            color: Colors.grey[200],
            child: TextField(
              decoration: InputDecoration(
                  prefixText: 'With prefixText: Your name is ',
                  suffixIcon: Icon(Icons.all_inclusive)),
            ),
          ),
          Divider(),
          Text('Without border'),
          Container(
            color: Colors.grey[200],
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'InputBorder.none',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15)),
            ),
          ),
          Divider(),
          Container(
            color: Colors.grey[200],
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'label+border',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15)),
            ),
          ),
          Divider(),
          Container(
            color: Colors.grey[200],
            child: TextField(
                decoration: InputDecoration.collapsed(hintText: 'InputDecoration.collapsed')),
          ),
          Divider(),
          Text('With outline border'),
          Container(
            color: Colors.grey[200],
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Divider(),
          Text('With custom border'),
          Container(
            color: Colors.grey[200],
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 5),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent, width: 2))),
            ),
          ),
          Divider(),
          Container(
            color: Colors.grey[200],
            child: TextField(
              cursorColor: Colors.redAccent,
              cursorWidth: 5,
              textAlign: TextAlign.center,
              obscureText: true,
              maxLength: 6,
              style: TextStyle(fontSize: 24, color: Colors.purple),
              decoration: InputDecoration.collapsed(hintText: 'Custom textfield, password'),
              textInputAction: TextInputAction.join,
              onEditingComplete: () => print('onEditingComplete'),
              onSubmitted: (value) => print('onSubmitted -> $value'),
              controller: _controller,
              focusNode: _focusNode,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Button(
              padding: EdgeInsets.all(10),
              child: Text('GET INUT VALUE'),
              onPressed: () {
                print(_controller.text);
              },
            ),
          ),
          Center(
            child: Button(
              padding: EdgeInsets.all(10),
              child: Text('DISMISS KEYBOARD using FocusNode'),
              onPressed: _dismissFocusNode,
            ),
          ),
          Center(
            child: Button(
              padding: EdgeInsets.all(10),
              child: Text('DISMISS ALL KEYBOARD'),
              onPressed: () {
                _dismissGlobalKeyboard(context);
              },
            ),
          ),
        ]),
      ),
    );
  }

  void _dismissFocusNode() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }
  }

  /**
   * https://flutterigniter.com/dismiss-keyboard-form-lose-focus/
   */
  void _dismissGlobalKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

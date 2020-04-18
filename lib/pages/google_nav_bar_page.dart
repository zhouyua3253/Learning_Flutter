import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavBarPage extends StatefulWidget {
  static String routeName = 'GoogleNavBar';

  @override
  _GoogleNavBarPageState createState() => _GoogleNavBarPageState();
}

class _GoogleNavBarPageState extends State<GoogleNavBarPage> {
  final List<Color> _bgColors = [Colors.orange, Colors.cyan, Colors.deepPurple, Colors.redAccent];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color activeColor = _bgColors[_selectedIndex];
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: <Widget>[
          PageView(
            physics: ClampingScrollPhysics(),
            children: _bgColors.map((color) => Container(color: color)).toList(),
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 60,
                    child: GNav(
                        // The space between icon and title
                        gap: 5,
                        // default icon color
                        color: Colors.black,
                        // active icon color
                        activeColor: Colors.white,
                        iconSize: 28,
                        textStyle: TextStyle(fontSize: 20, color: Colors.white),
                        backgroundColor: Colors.blueGrey,
                        tabBackgroundColor: Colors.redAccent[200],
                        // Tab content padding
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        duration: Duration(milliseconds: 500),
                        tabs: [
                          GButton(
                            icon: LineIcons.home,
                            text: 'Home',
                          ),
                          GButton(
                            icon: LineIcons.heart_o,
                            text: 'Likes',
                          ),
                          GButton(
                            icon: LineIcons.search,
                            text: 'Search',
                          ),
                          GButton(
                            icon: LineIcons.user,
                            text: 'Profile',
                          )
                        ],
                        selectedIndex: _selectedIndex,
                        onTabChange: (index) {
                          print(index);
                          setState(() {
                            _selectedIndex = index as int;
                          });
                        }),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      color: Colors.white,
                      child: GNav(
                          // The space between icon and title
                          gap: 5,
                          // default icon color
                          color: Colors.black,
                          // active icon color
                          activeColor: _bgColors[_selectedIndex],
                          iconSize: 28,
                          textStyle: TextStyle(fontSize: 20, color: _bgColors[_selectedIndex]),
                          tabBackgroundColor: _bgColors[_selectedIndex].withOpacity(0.2),
                          // Tab content padding
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          duration: Duration(milliseconds: 500),
                          tabs: [
                            GButton(
                              icon: LineIcons.home,
                              text: 'Home',
                            ),
                            GButton(
                              icon: LineIcons.heart_o,
                              text: 'Likes',
                            ),
                            GButton(
                              icon: LineIcons.search,
                              text: 'Search',
                            ),
                            GButton(
                              icon: LineIcons.user,
                              text: 'Profile',
                            )
                          ],
                          selectedIndex: _selectedIndex,
                          onTabChange: (index) {
                            setState(() {
                              _selectedIndex = index as int;
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

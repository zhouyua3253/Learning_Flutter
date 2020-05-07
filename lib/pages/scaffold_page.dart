import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  static const String routeName = '/scaffold';

  @override
  _ScaffoldPageState createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> with SingleTickerProviderStateMixin {
  final List _navigationItems = [
    {"title": 'Home', "icon": Icon(Icons.home)},
    {"title": 'Stats', "icon": Icon(Icons.show_chart)},
    {"title": 'Me', "icon": Icon(Icons.person_outline)}
  ];

  List<Widget> _tabItems = [
    Tab(text: 'page1'),
    Tab(text: 'page2'),
    Tab(text: 'page3'),
    Tab(text: 'page4'),
    Tab(text: 'page5'),
    Tab(text: 'page6'),
  ];
  List<Widget> _tabViews = [
    Center(
      child: Text('page1'),
    ),
    Center(
      child: Text('page2'),
    ),
    Center(
      child: Text('page3'),
    ),
    Center(
      child: Text('page4'),
    ),
    Center(
      child: Text('page5'),
    ),
    Center(
      child: Text('page6'),
    ),
  ];

  int _activeIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// TabController联动TabBar和TabBarView
    _tabController = TabController(length: _tabItems.length, vsync: this)
      ..addListener(() {
        // 点击选项卡切换时打印了2次
        int index = _tabController.index;
        String info = "tab index -> $index, indexIsChanging -> ${_tabController.indexIsChanging}";
        print(info);

        if (_activeIndex != index) {
          setState(() {
            _activeIndex = index;
          });
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.5,
        title: Text('Scaffold'),
        centerTitle: true,
        actions: <Widget>[
          // PopupMenuButton()
          IconButton(
            icon: Icon(
              Icons.translate,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.attach_file,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        bottomOpacity: 0.7,
        bottom: TabBar(
          tabs: _tabItems,
          controller: _tabController,
          isScrollable: true,
          // 调整tab的间距
          labelPadding: EdgeInsets.symmetric(horizontal: 30),
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 14),
          indicatorColor: Colors.pink,
          // indicatorSize: TabBarIndicatorSize.label,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 5,
        ),
      ),
      body: TabBarView(
        children: _tabViews,
        // 禁止TabBarView滚动
        // physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.cloud,
                    size: 70,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('STAR'),
                onTap: () {
                  debugPrint("STAR");
                },
              )
            ],
          ),
        ),
      ),
      endDrawer: Material(
        elevation: 16,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: double.infinity,
          color: Colors.lime,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            _activeIndex < 3 ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
            size: 32,
          ),
          onPressed: _manuallyChangeTabBarView),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _activeIndex % 2 == 1

          /// The common bottom navigation bar
          ? BottomNavigationBar(
              items: _navigationItems
                  .map((item) => BottomNavigationBarItem(
                        icon: (item["icon"] as Icon),
                        title: Text(item["title"] as String),
                      ))
                  .toList(),
              backgroundColor: Colors.white,
              iconSize: 25,
              selectedItemColor: Colors.pink,
              selectedFontSize: 12)

          /// Custom bottom bar, with floating action button inside
          : BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              color: Colors.blueGrey,
              // 圆形凹口
              shape: CircularNotchedRectangle(),
              notchMargin: 4),
    );
  }

  void _manuallyChangeTabBarView() {
    if (_activeIndex < 3) {
      _tabController.animateTo(5, duration: Duration(seconds: 2));
    } else {
      _tabController.animateTo(0, duration: Duration(seconds: 2));
    }
  }
}

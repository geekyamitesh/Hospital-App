import 'package:apk/Screens/tab.dart';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      // drawer: HomeDrawer(),
      body: Container(
        color: Color(0xFFF6F8FC),
        child: Column(
          children: <Widget>[
            Container(
              child: TopContainer(),
            ),
            BuildTabBar(
              controller: _controller,
            ),
            // Home(),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => Fabcircularmenu(fabKey: fabKey),
      ),

      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[200],
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.home,
            color: Color(0xFF3EB16F),
          ),
          title: new Text('Home', style: TextStyle(color: Colors.black)),
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.filter_frames,
            color: Color(0xFF3EB16F),
          ),
          title: new Text(
            'Feeds',
            style: TextStyle(color: Colors.black),
          ),
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color(0xFF3EB16F),
            ),
            title:
                Text("Push Messages", style: TextStyle(color: Colors.black))),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
              color: Color(0xFF3EB16F),
            ),
            title: Text(
              'More',
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
  }
}

class Fabcircularmenu extends StatelessWidget {
  const Fabcircularmenu({
    Key key,
    @required this.fabKey,
  }) : super(key: key);

  final GlobalKey<FabCircularMenuState> fabKey;

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      key: fabKey,
      // Cannot be `Alignment.center`
      alignment: Alignment.bottomRight,
      ringColor: Colors.transparent,
      ringDiameter: 350.0,
      ringWidth: 150.0,
      fabSize: 64.0,
      fabElevation: 8.0,

      // Also can use specific color based on wether
      // the menu is open or not:
      // fabOpenColor: Colors.white
      // fabCloseColor: Colors.white
      // These properties take precedence over fabColor
      fabColor: Colors.blueGrey,
      fabOpenIcon: Icon(Icons.add_circle, color: Colors.amber),
      fabCloseIcon: Icon(Icons.close, color: Colors.amber),
      fabMargin: const EdgeInsets.all(16.0),
      animationDuration: const Duration(milliseconds: 800),
      animationCurve: Curves.easeInOutCirc,
      onDisplayChange: (isOpen) {},
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(Icons.local_pharmacy, color: Colors.orange),
        ),
        RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(Icons.add_circle, color: Colors.red),
        ),
        RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(Icons.info, color: Colors.blueGrey),
        ),
      ],
    );
  }
}

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[400],
            offset: Offset(0, 3.5),
          )
        ],
        color: Color(0xFF3EB16F),
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0, right: 10, left: 10, top: 40),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 10, right: 30),
            child: Text(
              "Ashirwaad Hospital",
              style: TextStyle(
                fontFamily: "Angel",
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0, right: 10, left: 10, top: 40),
            child: Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

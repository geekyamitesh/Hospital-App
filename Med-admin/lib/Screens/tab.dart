import 'package:flutter/material.dart';

class tab_home extends StatefulWidget {
  tab_home({Key key}) : super(key: key);

  @override
  _tab_homeState createState() => _tab_homeState();
}

class _tab_homeState extends State<tab_home>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BuildTabBar(controller: _controller)),
    );
  }
}

class BuildTabBar extends StatelessWidget {
  const BuildTabBar({
    Key key,
    @required TabController controller,
  })  : _controller = controller,
        super(key: key);

  final TabController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new Container(
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: new BoxDecoration(color: Color(0xFF3EB16F)),
          child: new TabBar(
            controller: _controller,
            tabs: [
              new Tab(
                // icon: const Icon(Icons.home),
                text: "HISTORY",
              ),
              new Tab(
                // icon: const Icon(Icons.home),
                text: 'TODAY',
              ),
              new Tab(
                // icon: const Icon(Icons.my_location),
                text: 'UPCOMING',
              ),
            ],
          ),
        ),
        new Container(
          height: 80.0,
          child: new TabBarView(
            controller: _controller,
            children: <Widget>[
              Center(child: Text("APPOINTMENT HISTORY")),
              Center(child: Text("TODAY'S APPOINTMENTS")),
              Center(child: Text("UPCOMING APPOINTMENTS"))
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medicine_reminder/src/Drawer/Aboutus.dart';
import 'package:url_launcher/url_launcher.dart';

class Drawerex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Appbar"),
      ),
      drawer: HomeDrawer(),
    );
  }
}

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  Future<void> _launched;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.60,
        height: MediaQuery.of(context).size.height,
        color: Colors.green,
        child: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(color: Color(0xFF3EB16F)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Colors.amber,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Jhon Doe",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                ListTile(
                  dense: true,
                  title: Text(
                    "Medical Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.receipt,
                    color: Colors.lightGreen,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/home");
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Call an Ambulance",
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.call,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                      _launched = _makePhoneCall('tel:1234567890');
                    });
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Reserve a Room",
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.next_week,
                    color: Colors.green,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "About US",
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.amber,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    );
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/settings");
                  },
                ),
              ],
            ),
          ),
        ])),
      ),
    );
  }
}

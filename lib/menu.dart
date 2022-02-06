import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MenuPage createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {
  Widget _pageButton(String pageName, String pageRoute, IconData icon) {
    return ButtonTheme(
      height: 25.0,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, pageRoute);
        },
        icon: Icon(icon),
        label: Text(
          pageName,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(fixedSize: Size(100, 50)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(top: 40.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _pageButton('Travel Safety', '/travelMode', Icons.travel_explore),
            _pageButton('Going Out', '/clubMode', Icons.local_drink),
            _pageButton('Friend Finder', '/buddyMode', Icons.health_and_safety),
            _pageButton('Forum', '/forum', Icons.forum),
            _pageButton('Settings', '/settings', Icons.settings),
          ],
        ),
      ),
    );
  }
}

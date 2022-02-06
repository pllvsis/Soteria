import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  Widget _pageButton(String pageName, String pageRoute, IconData icon) {
    return ButtonTheme(
      height: 25.0,
      child: ElevatedButton.icon(
        onPressed: () {
          // Navigator.pushNamed(context, pageRoute);
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
    return Scaffold(
        body: SizedBox(
            height: height,
            child: Container(
              margin: const EdgeInsets.only(top: 25.0),
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _pageButton(
                      'Travel Safety', '/travelMode', Icons.travel_explore),
                  _pageButton('Going Out', '/clubMode', Icons.local_drink),
                  _pageButton(
                      'Friend Finder', '/buddyMode', Icons.health_and_safety),
                  _pageButton('Forum', '/forum', Icons.forum),
                  _pageButton('Settings', '/settings', Icons.settings),
                ],
              ),
            )));
  }
}

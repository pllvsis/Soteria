import 'package:flutter/material.dart';

class ClubPage extends StatefulWidget {
  const ClubPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  TextEditingController editingController = TextEditingController();
  final locationList = <String>[
    'Top of the Stairs',
    'Coop',
    'Milk Parlour',
    'Sharkies',
    'Hokie House'
  ];
  var searchedLocationList = <String>[];

  @override
  void initState() {
    searchedLocationList.addAll(locationList);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(locationList);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        searchedLocationList.clear();
        searchedLocationList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        searchedLocationList.clear();
        searchedLocationList.addAll(locationList);
      });
    }
  }

  Widget _locationCard(String location) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/location');
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff6a25a6), Color(0xfff7892b)]),
          ),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Text(location,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text('Going Out'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchedLocationList.length,
                      itemBuilder: (context, index) {
                        return _locationCard(searchedLocationList[index]);
                      }))
            ],
          ),
        ));
  }
}

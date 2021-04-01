import 'package:flutter/material.dart';
import 'package:news_hub/constants.dart';
import 'package:news_hub/screens/profile_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List<String> links = [
  "https://i.pinimg.com/originals/71/e8/34/71e8342f21ae39df7a35aea31d7287fc.jpg",
  "https://wallpaperaccess.com/full/3819170.jpg",
  "https://tse4.mm.bing.net/th?id=OIP.pWIG-8d_LprU86VEQSNA-gHaEU&pid=ImgDet&rs=1",
];

class _HomeState extends State<Home> {
  List<String> news = [
    "News 1",
    "News 2",
    "News 3",
    "News 1",
    "News 2",
    "News 3",
    "News 1",
    "News 2",
    "News 3",
    "News 1",
    "News 2",
    "News 3",
  ];
  Widget buildNewsItem(BuildContext context, int index) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          elevation: 2.0,
          child: ListTile(
            minVerticalPadding: 30.0,
            horizontalTitleGap: 20.0,
            onTap: () {},
            leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.network(
                  "$newsImage",
                  fit: BoxFit.cover,
                )),
            title: Text(
              "News # $index",
            ),
            subtitle: Text("Rooney "),
            trailing: Text(
              "4/1/2021",
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text("Profile"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text("Log Out"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            "News Hub",
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width / 1.01,
              color: Colors.grey[200],
              child: Text(
                "Image slider here",
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Flexible(
            flex: 2,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: buildNewsItem,
              itemCount: news.length,
            ),
          )
        ],
      ),
    );
  }
}

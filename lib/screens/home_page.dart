import 'package:flutter/material.dart';

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
        child: ListTile(
          onTap: () {},
          leading: Image.network(
              "https://th.bing.com/th/id/R6a7739f41b55d4577480caf13d09bcb0?rik=MjRm90l0fi207g&riu=http%3a%2f%2fimages4.fanpop.com%2fimage%2fphotos%2f23400000%2fRandom-football-images-soccer-23415648-404-561.jpg&ehk=PIuEEzLcebGwqdW1AmAnfs7%2ft%2b1ApVKpchO6Lhp0EAY%3d&risl=&pid=ImgRaw"),
          title: Text("News # $index"),
          subtitle: Text("Rooney "),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text("Profile"),
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

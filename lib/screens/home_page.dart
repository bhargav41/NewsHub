import 'package:flutter/material.dart';
import 'package:news_hub/constants.dart';
import 'package:news_hub/screens/news_screen.dart';
import 'package:news_hub/screens/profile_page.dart';
import 'package:news_hub/services/data.dart';
import 'package:news_hub/services/get_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dateTime(String date_time) {
    String datetime = date_time;
    String date = datetime.substring(0, 10);
    return date;
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
                Icons.category,
                color: Colors.black,
              ),
              title: Text("Categories"),
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
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("News Hub"),
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
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Data data = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemExtent: 150.0,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Card(
                            elevation: 2.0,
                            child: Center(
                              child: ListTile(
                                minVerticalPadding: 5.0,
                                horizontalTitleGap: 20.0,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsScreen(
                                              data.articles[index]
                                                  ['urlToImage'],
                                              data.articles[index]['title'],
                                              dateTime(data.articles[index]
                                                  ['publishedAt']),
                                              data.articles[index]
                                                  ['description'],
                                                  data.articles[index]['url'])));
                                },
                                leading: Image.network(
                                  "${data.articles[index]['urlToImage']}",
                                  fit: BoxFit.fill,
                                ),
                                title: Text(
                                  data.articles[index]['title'],
                                  overflow: TextOverflow.fade,
                                  maxLines: 5,
                                ),
                                trailing: Text(
                                  dateTime(data.articles[index]['publishedAt']),
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                    itemCount: data.totalResults,
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }
}

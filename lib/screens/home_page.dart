import 'package:carousel_slider/carousel_slider.dart';
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
          SizedBox(
            height: 10.0,
          ),
          Flexible(
            flex: 1,
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                Data data = snapshot.data;
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(seconds: 5),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[0]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[1]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[2]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[3]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[4]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[5]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[6]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[7]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[8]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              data.articles[9]['urlToImage'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ))
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 10.0,
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

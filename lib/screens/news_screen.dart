import 'package:flutter/material.dart';
import 'package:news_hub/constants.dart';
import 'package:news_hub/screens/web_view.dart';

class NewsScreen extends StatelessWidget {
  String image;
  String title;
  String date;
  String description;
  String url;
  NewsScreen(
      String image, String title, String date, String description, String url) {
    this.image = image;
    this.title = title;
    this.date = date;
    this.description = description;
    this.url = url;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("News Hub"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ArticleView(url)));
          },
          child: Card(
            elevation: 8.0,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.001,
              child: Column(
                children: [
                  Image.network('$image'),
                  SizedBox(
                    height: 30.0,
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                          trailing: Text("4/2/2021"),
                          title: Text(
                            title,
                            style: TextStyle(fontSize: 20.0),
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          description,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

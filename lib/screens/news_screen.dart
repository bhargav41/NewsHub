import 'package:flutter/material.dart';
import 'package:news_hub/constants.dart';

class NewsScreen extends StatelessWidget {
  int index;
  NewsScreen(int index) {
    this.index = index;
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
        child: Card(
          elevation: 8.0,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.35,
            child: Column(
              children: [
                Image.network("$bgImage"),
                SizedBox(
                  height: 30.0,
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                        trailing: Text("4/2/2021"),
                        title: Text(
                          "News $index",
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
                        "Description about News $index",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: 150.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      onPressed: () {},
                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      onPressed: () {},
                      child: Image.network("$fb"),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      onPressed: () {},
                      child: Image.network("$whatsapp"),
                    ),
                    FloatingActionButton(
                      elevation: 0.0,
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: Image.network("$twitter"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

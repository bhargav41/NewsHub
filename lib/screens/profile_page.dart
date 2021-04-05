import 'package:flutter/material.dart';
import 'package:news_hub/constants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shadowColor: Colors.grey,
                elevation: 8.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    CircleAvatar(
                      radius: 70.0,
                      backgroundImage: NetworkImage(
                        "$newsImage",
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      " Wayne Rooney",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "waynerooney@gmail.com",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_iphone_outlined,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "+91 9991091308",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Turn On Notifications "),
            ),
            SizedBox(height: 10.0),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.language),
              title: Text("Language Settings"),
            ),
            SizedBox(height: 10.0),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override 
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Schoober Driver"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Johannes Ramothale"),
              accountEmail: new Text("jlramothale@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
                child: new Text("JR"),
              ),
              onDetailsPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(ProfilePage.tag);
              },
            ),
            new ListTile(
              title: new Text("Time Slots"),
              trailing: new Icon(Icons.timer),
              onTap: () { 
                // Navigator.of(context).pop();
                // Navigator.of(context).pushNamed(NewPage.tag);
              }
            ),
            new ListTile(
              title: new Text("Vehicle"),
              trailing: new Icon(Icons.train),
            ),
            new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pushReplacementNamed(LoginPage.tag),
            ),
            // new Divider(),
            // new ListTile(
            //   title: new Text("Logout"),
            //   trailing: new Icon(Icons.close),
            //   onTap: () => Navigator.of(context).pop(),
            // ),
          ],
        )
      ),
      body: new Center(

      ),
    );
  }

}
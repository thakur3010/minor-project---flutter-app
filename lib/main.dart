import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Components/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie_creation_outlined,size: 30,),
            SizedBox(
              width: 17.0,
            ),
            Text("MovieManiac",
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30,
              ),
            )
          ],
        ),
        backgroundColor:Color(0xff303030) ,
        elevation: 0.0,

      ),
      body: Container(
        color: Color(0xff303030),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             if (_page == 0) HomePage() else Container(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.list, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Color(0xff303030),
        buttonBackgroundColor: Colors.red,
        backgroundColor: Color(0xff303030),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

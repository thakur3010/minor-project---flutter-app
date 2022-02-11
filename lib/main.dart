// @dart=2.9
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movie_reccomandation_app/Components/theme_const.dart';
import 'package:movie_reccomandation_app/Components/theme_manager.dart';
import 'Components/HomePage.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
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
            Icon(
              Icons.movie_creation_outlined,
              size: 30,
            ),
            SizedBox(
              width: 17.0,
            ),
            Text(
              "MovieManiac",
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30,
              ),
            ),
          ],
        ),
        elevation: 0.0,
        actions: [
          Switch(
              activeColor: Colors.tealAccent,
              inactiveThumbColor: Colors.redAccent,
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              })
        ],
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_page == 0) HomePage() else Container(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: (_themeManager.themeMode == ThemeMode.dark)
            ? Colors.red
            : Colors.teal,
        index: 0,
        height: 60.0,
        backgroundColor: (_themeManager.themeMode == ThemeMode.dark)
            ? Colors.red
            : Colors.teal,
        buttonBackgroundColor: (_themeManager.themeMode == ThemeMode.dark)
            ? Colors.tealAccent
            : Colors.redAccent,
        items: <Widget>[
          Icon(Icons.list, size: 30, color: Colors.black),
          Icon(Icons.settings, size: 30, color: Colors.black),
        ],
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

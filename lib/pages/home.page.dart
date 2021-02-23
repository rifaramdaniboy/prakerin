import 'package:covid/halaman/about.dart';
import 'package:covid/halaman/global.dart';
import 'package:covid/halaman/provinsi.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variable

  //Variable baru
  final PageProvinsi _listProvinsi = PageProvinsi();
  final PageGlobal _listGlobal = PageGlobal();
  final PageAbout _listAbout = PageAbout();

  Widget _showPage = new PageProvinsi();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _listProvinsi;
        break;
      case 1:
        return _listGlobal;
        break;
      case 2:
        return _listAbout;
        break;
      default:
        return new Container(
          child: new Center(
            child: Text(
              'No page found by page chooser',
              style: new TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Tracking Covid',
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.purple.withOpacity(.0001),
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.bookmarks_outlined, size: 30),
          Icon(Icons.campaign_outlined, size: 30),
        ],
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}

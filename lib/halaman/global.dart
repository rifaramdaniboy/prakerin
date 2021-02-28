import 'package:covid/api/post_model.dart';
import 'package:covid/api/http_service.dart';
import 'package:covid/core/consts.dart';
// ignore: unused_import
import 'package:covid/core/flutter_icons.dart';
import 'package:flutter/material.dart';

class PageGlobal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataGlobal _getGlobal = new DataGlobal();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Stack(
              children: <Widget>[
                Image.asset("assets/images/virus2.png"),
                _homeHeader(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _home(),
        Card(
          child: Container(
            child: ListTile(
              title: Text("Positif"),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sad.png'),
              ),
            ),
          ),
        ),
        Card(
          child: Container(
            child: ListTile(
              title: Text("Sembuh"),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/happy.png'),
              ),
            ),
          ),
        ),
        Card(
          child: Container(
            child: ListTile(
              title: Text("Meninggal"),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sedih.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _home() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Data Kasus Global',
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.all(16),
        ),
      ],
    );
  }
}

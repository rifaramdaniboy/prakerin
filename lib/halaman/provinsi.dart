import 'package:covid/core/consts.dart';
// ignore: unused_import
import 'package:covid/core/flutter_icons.dart';
import 'package:flutter/material.dart';

class PageProvinsi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(top: 25, bottom: 30),
            child: Stack(
              children: <Widget>[
                Image.asset("assets/images/virus2.png"),
                _homeHeader(),
              ],
            ),
          ),
          Center(
              child: Text(
            'Data Kasus Corona Berdasarkan Global',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )),
          Padding(
            padding: EdgeInsets.all(6.0),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Nomor')),
              DataColumn(label: Text('provinsi')),
              DataColumn(label: Text('Positif')),
              DataColumn(label: Text('Sembuh')),
              DataColumn(label: Text('Meninggal')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Jawa barat')),
                DataCell(Text('50')),
                DataCell(Text('45')),
                DataCell(Text('5')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('Jawa timur')),
                DataCell(Text('40')),
                DataCell(Text('30')),
                DataCell(Text('5')),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('Kalimantan')),
                DataCell(Text('70')),
                DataCell(Text('50')),
                DataCell(Text('6')),
              ]),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
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
          'Data Kasus Provinsi',
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.all(10),
        ),
      ],
    );
  }
}

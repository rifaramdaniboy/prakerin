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
    return ListView(
      children: <Widget>[
        Column(
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
            SizedBox(height: 20.0),
            Center(
                child: Text(
              'Data Kasus Corona Berdasarkan Global',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            FutureBuilder(
              future: _getGlobal.getDataGlobal(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CovidGlobal>> snapshot) {
                if (snapshot.hasData) {
                  List<CovidGlobal> dataGlobal = snapshot.data;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Negara')),
                        DataColumn(label: Text('Positif')),
                        DataColumn(label: Text('Sembuh')),
                        DataColumn(label: Text('Meninggal')),
                      ],
                      rows: dataGlobal
                          .map((CovidGlobal dataGlobal) => DataRow(cells: [
                                DataCell(Text(dataGlobal.countryRegion)),
                                DataCell(Text(dataGlobal.confirmed.toString())),
                                DataCell(Text(dataGlobal.recovered.toString())),
                                DataCell(Text(dataGlobal.deaths.toString())),
                              ]))
                          .toList(),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        )
      ],
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
          width: 10,
          height: 10,
          margin: EdgeInsets.all(16),
        ),
      ],
    );
  }
}

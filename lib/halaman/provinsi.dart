import 'package:covid/api/post_model.dart';
import 'package:covid/api/http_service.dart';
import 'package:covid/core/consts.dart';

// ignore: unused_import
import 'package:covid/core/flutter_icons.dart';
import 'package:flutter/material.dart';

class PageProvinsi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataIndo _getIndo = new DataIndo();
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
              'Data Kasus Corona Berdasarkan Provinsi',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: EdgeInsets.all(6.0),
            ),
            FutureBuilder(
              future: _getIndo.getDataIndo(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CovidProvinsi>> snapshot) {
                if (snapshot.hasData) {
                  List<CovidProvinsi> dataIndo = snapshot.data;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Provinsi')),
                        DataColumn(label: Text('Positif')),
                        DataColumn(label: Text('Sembuh')),
                        DataColumn(label: Text('Meninggal')),
                      ],
                      rows: dataIndo
                          .map((CovidProvinsi dataIndo) => DataRow(cells: [
                                DataCell(Text(dataIndo.provinsi)),
                                DataCell(Text(dataIndo.kasus_posi.toString())),
                                DataCell(Text(dataIndo.kasus_sem.toString())),
                                DataCell(Text(dataIndo.kasus_meni.toString())),
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
              title: Text(
                "Sembuh",
              ),
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
          width: 10,
          height: 10,
          margin: EdgeInsets.all(16),
        ),
      ],
    );
  }
}

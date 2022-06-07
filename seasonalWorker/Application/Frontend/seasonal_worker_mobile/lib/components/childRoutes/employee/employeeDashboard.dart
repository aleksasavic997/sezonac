import 'package:flutter/material.dart';
import 'package:seasonal_worker_mobile/main.dart';
import '../../../layout/drawer.dart';
import '../../../layout/header.dart';

class DashboardEmployee extends StatelessWidget {
  DashboardEmployee({Key /*?*/ key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String employeeCredentials;
    if(loginWorker != null) {
      employeeCredentials = 'Dobro došli ${loginWorker.firstName} ${loginWorker.lastName}';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${employeeCredentials}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 100,
                child: Header(100, false, Icons.dashboard)
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                child: Text('Oglasi za poslove prema Vašim kriterijumima', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Card(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    ...ListTile.divideTiles(
                      color: Colors.grey,
                      tiles: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          leading: Icon(Icons.ad_units),
                          title: Text('Oglas: Ime Oglasa'),
                          subtitle: Text('Poslodavac je postavio ponudu koja se uklapa u Vaše kriterijume')
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          leading: Icon(Icons.ad_units),
                          title: Text('Oglas: Ime Oglasa'),
                          subtitle: Text('Poslodavac je postavio ponudu koja se uklapa u Vaše kriterijume')
                        ),
                      ]
                    )
                  ]
                ),
              )
            ) 
          ]
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
    
}
import 'package:flutter/material.dart';
import 'package:seasonal_worker_mobile/main.dart';
import '../../../layout/drawer.dart';
import '../../../layout/header.dart';

class DashboardEmployer extends StatelessWidget {
  DashboardEmployer({Key /*?*/ key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      String employerCredentials;
      if(loginEmployer != null) {
        employerCredentials = loginEmployer.employerName;
      }


    return Scaffold(
      appBar: AppBar(
        title: Text('${employerCredentials}'),
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
                child: Text('Vaši oglasi'),
            ),
            Card(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[  
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                      child:  ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        title: Text('Prijava: Ime Oglasa'),
                        subtitle: Text('Kandidat Ime i prezime, izvrsio je prijavu na oglas: Ime Oglasa, id'),
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                      child:  ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        title: Text('Prijava: Ime Oglasa'),
                        subtitle: Text('Kandidat Ime i prezime, izvrsio je prijavu na oglas: Ime Oglasa, id'),
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                      child:  ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        title: Text('Prijava: Ime Oglasa'),
                        subtitle: Text('Kandidat Ime i prezime, izvrsio je prijavu na oglas: Ime Oglasa, id'),
                      )
                    )
                  ],
                )
              ),
            )
          ],
        )),
        drawer: NavigationDrawer(),
    );
  }
}

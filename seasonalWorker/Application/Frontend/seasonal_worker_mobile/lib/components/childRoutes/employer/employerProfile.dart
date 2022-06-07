import 'package:flutter/material.dart';
import '../../../layout/drawer.dart';
import '../../../layout/header.dart';
import 'package:seasonal_worker_mobile/main.dart';

class EmployerProfile extends StatelessWidget {
  EmployerProfile({Key/*?*/ key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    String employerCredentials;
    String employerMail;
    String companyDescription;
    String companyLocation;
    String companyPhoneNumber;
    String areaOfActivity;
    if(loginEmployer != null) {
      employerCredentials = loginEmployer.employerName;
      employerMail = loginEmployer.email;
      companyDescription = loginEmployer.employerDescription;
      companyLocation = loginEmployer.cityName;
      companyPhoneNumber = loginEmployer.phoneNumber;
      areaOfActivity = loginEmployer.areaOfActivityName;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${employerCredentials}'),
      ),
      body: SingleChildScrollView(
         child: Stack(
           children: [
              Container(
                    height: 100,
                    child: Header(100, false, Icons.password_sharp)
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 5, color: Colors.white),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),)
                        ]
                      ),
                      child: Icon(Icons.person, size: 80, color: Colors.grey.shade300)
                    ),
                    SizedBox(height: 20,),
                    Text('${employerCredentials}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    Card(
                      child: 
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(15),
                          child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                ...ListTile.divideTiles(
                                  color: Colors.grey,
                                  tiles: [
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.mail),
                                      title: Text('Elektronski naslov'),
                                      subtitle: Text('${employerMail}')
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.description),
                                      title: Text('Opis područja'),
                                      subtitle: Text('${companyDescription}')
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.location_city),
                                      title: Text('Lokacija'),
                                      subtitle: Text('${companyLocation}')
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.phone_rounded),
                                      title: Text('Kontakt telefon'),
                                      subtitle: Text('${companyPhoneNumber}')
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.local_activity_outlined),
                                      title: Text('Vrsta Delatnosti'),
                                      subtitle: Text('${areaOfActivity}')
                                    )
                                  ]
                                )
                              ],
                            )
                          ],
                        )
                      ),  
                    )
                  ],
                )
              )
           ],
          )
      ),
      drawer: NavigationDrawer(),
    );
  }
}
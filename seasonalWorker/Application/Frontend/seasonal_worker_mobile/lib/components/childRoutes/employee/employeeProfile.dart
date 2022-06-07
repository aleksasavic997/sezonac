import 'package:flutter/material.dart';
import '../../../layout/drawer.dart';
import '../../../layout/header.dart';
import 'package:seasonal_worker_mobile/main.dart';

class EmployeeProfile extends StatelessWidget {
  EmployeeProfile({Key/*?*/ key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {

    String employeeCredentials;
    DateTime employeeBirthDate;
    String employeeSex;
    String employeeMail;
    String employeePhone;
    String employeeCoverLetter;
    String employeeCity;
    if (loginWorker != null) {
      employeeCredentials = '${loginWorker.firstName} ${loginWorker.lastName}';
      employeeBirthDate = loginWorker.dateOfBirth;
      employeeSex = loginWorker.getSex;
      employeeMail = loginWorker.email;
      employeePhone = loginWorker.phoneNumber;
      employeeCoverLetter = loginWorker.coverLetter;
      employeeCity = loginWorker.cityName;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${employeeCredentials}'),
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
                  Text('${employeeCredentials}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Card(
                    child: Container(
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
                                      leading: Icon(Icons.date_range),
                                      title: Text('Datum rodjenja'),
                                      subtitle: Text('${employeeBirthDate}')
                                  ),
                                  ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.face_retouching_natural_outlined),
                                      title: Text('Pol'),
                                      subtitle: Text('${employeeSex}')
                                  ),
                                  ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.mail_outline),
                                      title: Text('Elektronski naslov'),
                                      subtitle: Text('${employeeMail}')
                                  ),
                                  ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.phone_rounded),
                                      title: Text('Kontakt telefon'),
                                      subtitle: Text('${employeePhone}')
                                  ),
                                  ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.forward_to_inbox_outlined),
                                      title: Text('Propratno pismo'),
                                      subtitle: Text('${employeeCoverLetter}')
                                  ),
                                  ListTile(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      leading: Icon(Icons.location_city),
                                      title: Text('Lokacija'),
                                      subtitle: Text('${employeeCity}')
                                  ),
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
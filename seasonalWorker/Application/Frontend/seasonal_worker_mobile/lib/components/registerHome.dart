import 'package:flutter/material.dart';
import 'package:seasonal_worker_mobile/components/childRoutes/registerEmployee.dart';
import 'childRoutes/registerEmployer.dart';

class RegisterHome extends StatefulWidget {

   @override
  _RegisterHomeState createState() => _RegisterHomeState();
}

class _RegisterHomeState extends State<RegisterHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registracija'),
      ),
      body: Center(
        child: Wrap (
          children: <Widget> [
            Card(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: const ListTile(
                      title: Text('Tražim posao'),
                      subtitle: Text('Želim napraviti korisnički profil uz pomoć kog mogu doći do posla.'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child:  Align(
                      alignment: Alignment.bottomRight,
                      child:  TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterEmployee()),
                          );
                        },
                        child: const Text('Kreiraj profil'),
                      )
                    ),
                  )
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: const ListTile(
                      title: Text('Nudim posao'),
                      subtitle: Text('Želim napraviti korisnički profil uz pomoć kog mogu da objavljujem ponude za posao.'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child:  Align(
                      alignment: Alignment.bottomRight,
                      child:  TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterEmployer()),
                          );
                        },
                        child: const Text('Kreiraj profil'),
                      )
                    )
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
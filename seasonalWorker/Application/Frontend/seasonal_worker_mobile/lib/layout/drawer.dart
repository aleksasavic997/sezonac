import 'package:flutter/material.dart';
import 'package:seasonal_worker_mobile/components/landingPage.dart';
import '../components/childRoutes/employee/additionalFilterSearch.dart';
import '../components/childRoutes/employer/add_edit.dart';
import '../components/childRoutes/employer/employerDahsboard.dart';
import '../components/childRoutes/employer/employerProfile.dart';
import 'package:seasonal_worker_mobile/main.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildHeader(context),
        buildMenuItems(context),
      ],
    ));
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );
  Widget buildMenuItems(BuildContext context) => Wrap(
        children: [
          ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Radna Površina'),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => DashboardEmployer()))),
          ListTile(
              leading: const Icon(Icons.face_outlined),
              title: const Text('Moj Profil'),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => EmployerProfile()))),
          if (!isWorker)
            ListTile(
                leading: const Icon(Icons.note_add_outlined),
                title: const Text('Postavite oglas za posao'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => AddEditOfferForm())))
          else
            ListTile(
                leading: const Icon(Icons.search_off_outlined),
                title: const Text('Napredna pretraga poslova'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => AdditionalFilterSearch()))),
          const Divider(color: Colors.black),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 32),
              child: ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Odjava'),
                onTap: () {
                  if (isWorker) {
                    loginWorker = null;
                  } else {
                    loginEmployer = null;
                  }
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LandingPage()));
                },
              ))
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:seasonal_worker_mobile/models/ViewModels/employerInfo.dart';
import 'package:seasonal_worker_mobile/models/workerData.dart';
import 'package:seasonal_worker_mobile/services/APIWorkers.dart';
import 'components/childRoutes/registerEmployee.dart';
import 'components/childRoutes/registerEmployer.dart';
import 'components/forgotPassword.dart';
import 'components/landingPage.dart';
import 'components/registerHome.dart';
import 'models/ViewModels/workerInfo.dart';

void main() {
  runApp(MyApp());
}

WorkerInfo loginWorker;
bool isWorker;
EmployerInfo loginEmployer;

class MyApp extends StatelessWidget {
  static WorkerData /*?*/ workerData;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/register-home': (BuildContext context) => new RegisterHome(),
        '/register-employer': (BuildContext context) => new RegisterEmployer(),
        'register-employee': (BuildContext context) => new RegisterEmployee(),
        'forgot-password': (BuildContext context) => new ForgotPassword()
      },
      home: LandingPage(title: 'Sezonac'),
    );
  }
}

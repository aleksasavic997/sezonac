import 'package:flutter/material.dart';
import 'package:seasonal_worker_mobile/components/registerHome.dart';
import 'package:seasonal_worker_mobile/main.dart';
import 'package:seasonal_worker_mobile/services/APIEmployers.dart';

import '../layout/header.dart';
import '../models/workerData.dart';
import '../services/APIWorkers.dart';
import 'childRoutes/employer/employerDahsboard.dart';
import '../components/childRoutes/employee/employeeDashboard.dart';
import 'forgotPassword.dart';

String username;
String password;

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.title}) : super(key: key);

  final String  title;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Prijavite se'),
      ),
      body: SingleChildScrollView(
        child: isValid ? 
        Center(
            child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ) : 
        FutureBuilder<List<WorkerData>>(
          future: APIWorkers.getAllWorkers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  if (!isKeyboardVisible)
                    Container(
                      height: 200,
                      child: Header(200, true, Icons.login_sharp),
                    ),
                  Form(
                    key: _formKey,
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: TextFormField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: 'Unesite Vaše korisničko ime',
                              labelText: 'Korisničko ime *',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Polje je obavezno!';
                              }
                              return null;
                            },
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.password),
                              hintText: 'Unesite Vašu lozinku',
                              labelText: 'Vaša lozinka *',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Polje je obavezno!';
                              }
                              return null;
                            },
                          )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: OutlinedButton(
                        onPressed: () async {
                          if(_formKey.currentState.validate()) {
                            isValid = true;
                            username = usernameController.text;
                            password = passwordController.text;
                            var checkUser = await APIWorkers.checkUser(username, password);

                            if (checkUser is String && checkUser.isNotEmpty) {
                              var checkWorkerStringHelper = checkUser.toString().split('"id":')[1];
                              int workerID = int.parse(checkWorkerStringHelper.toString().split(',')[0]);
                              loginWorker = await APIWorkers.getWorkerInfoById(workerID);
                              isWorker = true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DashboardEmployee()),
                              );
                            }
                            if (checkUser is bool && checkUser == false) {
                              checkUser = await APIEmployers.checkEmployer(username, password);
                              if (checkUser is String && checkUser.isNotEmpty) {
                                var checkEmployerStringHelper = checkUser.toString().split('"id":')[1];
                                int employerID = int.parse(checkEmployerStringHelper.toString().split(',')[0]);
                                loginEmployer =await APIEmployers.getEmployerInfoById(employerID);
                                isWorker = false;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DashboardEmployer()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Molimo Vas, unesite ispravne podatke.'),
                                  backgroundColor: Colors.redAccent,
                                ));
                              }
                            }
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('PRIJAVA')),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 12),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()),
                          );
                        },
                        child: const Text('Zaboravljena lozinka?')),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 12),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterHome()),
                          );
                        },
                        child: const Text('Nov Korisnik? Napravite profil')),
                  ),
                  // Text(snapshot.data[0].firstName), //name
                ],
              );
            }
            print('snapshot is empty.');
            return Container();
          },
        ),
      ),
    );
  }
}

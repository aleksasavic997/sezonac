import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:seasonal_worker_mobile/models/areaOfActivity.dart';
import 'package:seasonal_worker_mobile/services/APIAreaOfActivities.dart';
import 'package:seasonal_worker_mobile/services/APICities.dart';
import 'package:seasonal_worker_mobile/services/APIEmployers.dart';
import '../../models/cityData.dart';
import '../../models/employerData.dart';
import '../landingPage.dart';

int id;
String employerName;
String employerUsername;
String employerPassword;
String employerDescription;
String profileImageUrl;
String email;
String phoneNumber;
int employerTypeId;
int cityId;
int areaOfActivityId;

class RegisterEmployer extends StatefulWidget {
  @override
  _RegisterEmployer createState() => _RegisterEmployer();
}

class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({@required this.title, this.value = false});
}

class _RegisterEmployer extends State<RegisterEmployer> {
  final companyNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final companyDescriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  CityData _selectedCity;
  AreaOfActivityData _selectedWorkingArea;
  bool isValid = false;
  bool isSelected = false;
  bool isChecked;

  List<CityData> _apiCities = new List<CityData>();

  handleSelectedCities(value) {
    setState(() {
      _selectedCity = value;
    });
  }

  handleAreaSelect(value) {
    setState(() {
      _selectedWorkingArea = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Napravite profil poslodavca'),
        ),
        body: Center(
            child: isValid
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : ListView(
                    children: <Widget>[
                      Form(
                          key: _formKey,
                          child: Wrap(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: TextFormField(
                                  controller: companyNameController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.account_box_rounded),
                                    hintText: 'Unesite ime područja poslovanja',
                                    labelText: 'Ime područja *',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Polje je obavezno!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: TextFormField(
                                  controller: usernameController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.account_box_rounded),
                                    hintText: 'Izaberite Vaše korisničko ime',
                                    labelText: 'Korisničko ime područja *',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Polje je obavezno!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: TextFormField(
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.password),
                                    hintText: 'Izaberite Vašu lozinku',
                                    labelText: 'Vaša lozinka *',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Polje je obavezno!';
                                    }
                                    if (value != null && value.length < 3) {
                                      return 'Lozinka ne sme biti kraća od tri karaktera';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.email_outlined),
                                    hintText: 'Unesite Vašu e-mail adresu',
                                    labelText: 'Vaš e-mail *',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Polje je obavezno!';
                                    }
                                    if (value != null &&
                                        !value.contains('@') &&
                                        !value.contains('.')) {
                                      return 'Unesite ispravnu elektronsku adresu';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: TextFormField(
                                  controller: phoneNumberController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.numbers_outlined),
                                    hintText: 'Unesite Vaš telefonski broj',
                                    labelText: 'Vaš broj telefona *',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Polje je obavezno!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: FutureBuilder(
                                    future: APICities.getAllCities(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (!snapshot.hasData) {
                                        return CircularProgressIndicator(
                                            strokeWidth: 2,
                                            backgroundColor: Colors.teal[900]);
                                      } else {
                                        for (var city in snapshot.data) {
                                          _apiCities.add(city);
                                        }
                                        return DropdownSearch<CityData>(
                                          mode: Mode.MENU,
                                          onFind: (String cityData) =>
                                              APICities.getAllCities(),
                                          itemAsString: (CityData city) =>
                                              city.getCityName,
                                          // ignore: deprecated_member_use
                                          label: "Izaberite Grad",
                                          onChanged: (value) {
                                            handleSelectedCities(value);
                                          },
                                          validator: (value) {
                                            if(value == null || value.cityName.isEmpty) {
                                              return 'Morate izabrati jednu lokaciju';
                                            }
                                            return null;
                                          } 
                                        );
                                      }
                                    },
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: TextFormField(
                                  controller: companyDescriptionController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.description_outlined),
                                    hintText:
                                        'Unesite kratak opis Vaše delatnosti',
                                    labelText: 'Opis',
                                  ),
                                  minLines: 1,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                child: DropdownSearch<AreaOfActivityData>(
                                  mode: Mode.MENU,
                                  onFind: (String cityData) =>
                                      APIAreaOfActivities
                                          .getAllAreaOfActivities(),
                                  itemAsString: (AreaOfActivityData
                                          areaOfActivityData) =>
                                      areaOfActivityData
                                          .getAreaOfActivityName,
                                  // ignore: deprecated_member_use
                                  label: "Izaberite Oblast",
                                  onChanged: (value) {
                                    handleAreaSelect(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.areaOfActivityName.isEmpty) {
                                      return 'Morate izabrati oblast poslovanja';
                                    }
                                    return null;
                                  },
                                )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: OutlinedButton(
                                        onPressed: () async {
                                          if(_formKey.currentState.validate()) {
                                            isValid = true;
                                            EmployerData employer =
                                              new EmployerData(
                                                  employerName = companyNameController.text,
                                                  employerUsername = usernameController.text,
                                                  employerPassword = passwordController.text,
                                                  employerDescription = companyDescriptionController.text,
                                                  profileImageUrl,
                                                  email = emailController.text,
                                                  phoneNumber = phoneNumberController.text,
                                                  employerTypeId = 1,
                                                  cityId = _selectedCity.id,
                                                  areaOfActivityId = _selectedWorkingArea.id
                                              );
                                            var registerEmployer = await APIEmployers.registration(employer);
                                            if (registerEmployer == true) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LandingPage()),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                content: Text('Došlo je go greške.'),
                                                backgroundColor: Colors.redAccent,
                                                ),
                                              );
                                            }
                                          } 
                                        },
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        child: const Text('Kreirajte Profil')),
                                  )),
                            ],
                          ))
                    ],
                  )));
  }
}

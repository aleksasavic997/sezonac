
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:seasonal_worker_mobile/components/landingPage.dart';
import 'package:seasonal_worker_mobile/models/workerData.dart';
import 'package:seasonal_worker_mobile/services/APICities.dart';
import 'package:seasonal_worker_mobile/services/APIWorkers.dart';
import '../../models/cityData.dart';

int id;
String firstName;
String lastName;
String username;
String pass;
bool sex;
String profileImageUrl;
String email;
DateTime dateOfBirth;
String cvUrl;
String coverLetter;
String phoneNumber;
int cityId;

enum SelectGender { female, male }

class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({Key key}) : super(key: key);

  @override
  _RegisterEmployee createState() => _RegisterEmployee();
}

class _RegisterEmployee extends State<RegisterEmployee> {
  final firstNameController =  TextEditingController();
  final lastNameController =  TextEditingController();
  final usernameController = TextEditingController();
  final dateOfBithController = TextEditingController();
  final passwordController = TextEditingController();
  final emailontroller = TextEditingController();
  final phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  SelectGender _genderRadioBtnVal = SelectGender.female;
  CityData _selectedCity;
  bool isValid = false;
  List<String> _apiCities = new List<String>();
  DateTime dateTime;


  handleSelectedCities(value) {
    setState(() {
      _selectedCity = value;
    });
  }

  uploadFile() async {
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;
    final file = result.files.first;
    openFile(file);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Napravite profil radnika'),
      ),
      body: Center(
        child: isValid ? 
          Center(
            child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
          )
        : ListView(
          children: <Widget> [
            Form(
              key: _formKey,
              child: Wrap(
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_box_rounded),
                        hintText: 'Unesite Vaše ime',
                        labelText: 'Ime *',
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Polje je obavezno!';
                        }
                        if(value != null && value.contains(new RegExp(r'[0-9]'))) {
                          return 'U imenu i prezimenu ne smeju se nalaziti brojevi.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_box_rounded),
                        hintText: 'Unesite Vaše prezime',
                        labelText: 'Prezime *',
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Polje je obavezno!';
                        }
                        if(value != null && value.contains(new RegExp(r'[0-9]'))) {
                          return 'U imenu i prezimenu ne smeju se nalaziti brojevi.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_box_rounded),
                        hintText: 'Unesite Vaše korisničko ime',
                        labelText: 'Korisničko ime *',
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Polje je obavezno!';
                        }
                        if(value != null && value.contains(new RegExp(r'[0-9]'))) {
                          return 'U imenu i prezimenu ne smeju se nalaziti brojevi.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: TextFormField(
                      controller: dateOfBithController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_box_rounded),
                        hintText: 'Unesite Vaš datum rodjenja',
                        labelText: 'Datum rodjenja *',
                      ),
                      enabled: true,
                      onTap: () {
                            FocusScope.of(context).requestFocus(new FocusNode());
                            pickDate(context);
                      },
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Polje je obavezno!';
                        }
                        if(value != null && !value.contains(new RegExp(r'[0-9]'))) {
                          return 'Datum rodjenja se mora sastojati iz brojeva';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: TextFormField(
                      obscureText: true,
                      maxLength: 20,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        hintText: 'Izaberite Vašu lozinku',
                        labelText: 'Vaša lozinka *',
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Polje je obavezno!';
                        }
                        if(value != null && value.length < 3) {
                          return 'Lozinka ne sme biti kraća od tri karaktera';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: TextFormField(
                      controller: emailontroller,
                       decoration: const InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        hintText: 'Unesite Vašu e-mail adresu',
                        labelText: 'Vaš e-mail *',
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Polje je obavezno!';
                        }
                        if(value != null && !value.contains('@') && !value.contains('.')) {
                          return 'Unesite ispravnu elektronsku adresu';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: FutureBuilder(
                      future: APICities.getAllCities(),
                      builder: (BuildContext context, AsyncSnapshot<List<CityData>> snapshot) {
                        if(!snapshot.hasData) {
                          return CircularProgressIndicator(
                                    strokeWidth: 2,
                                    backgroundColor: Colors.teal[900]
                                  );
                          } else {
                            for (var city in snapshot.data) {
                              _apiCities.add(city.cityName);
                            }
                            return DropdownSearch<CityData>(
                                mode: Mode.MENU,
                                onFind: (String cityData) => APICities.getAllCities(),
                               itemAsString: (CityData city) => city.getCityName,
                                // ignore: deprecated_member_use
                                label: "Izaberite Grad",
                                onChanged: (value) {
                                handleSelectedCities(value);
                              },
                              validator: (value) {
                                if (value == null || value.cityName.isEmpty) {
                                  return 'Morate izabrati jednu lokaciju.';
                                }
                                return null;
                              },
                            ); 
                          }
                      },
                      )
                  ),
                  Column(
                    children: <Widget> [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Pol'),
                        )
                      ),
                      ListTile(
                        title: const Text('Ženski'),
                        leading: Radio<SelectGender>(
                          value: SelectGender.female,
                          groupValue: _genderRadioBtnVal,
                          onChanged: (SelectGender value) {
                            setState(() {
                              _genderRadioBtnVal = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Muški'),
                        leading: Radio<SelectGender>(
                          value: SelectGender.male,
                          groupValue: _genderRadioBtnVal,
                          onChanged: (SelectGender value) {
                            setState(() {
                              _genderRadioBtnVal = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: OutlinedButton(
                        onPressed: () {
                          uploadFile();
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('Otpremite svoj CV')
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child:  OutlinedButton(
                        onPressed: () async { 
                          if(_formKey.currentState.validate()) {
                            isValid = true;

                            if(_genderRadioBtnVal == SelectGender.male) {
                              sex = true;
                            } else {
                              sex = false;
                            }

                            WorkerData worker = new WorkerData(
                              firstName = firstNameController.text, 
                              lastName = lastNameController.text,
                              username = usernameController.text, 
                              pass = passwordController.text, 
                              sex, 
                              profileImageUrl, 
                              email = emailontroller.text, 
                              dateOfBirth = dateTime, 
                              cvUrl, 
                              coverLetter, 
                              cityId = _selectedCity.id, 
                              phoneNumber = phoneNumberController.text
                            );  
                            var registerWorker = await APIWorkers.registration(worker); 
                            if (registerWorker == true) {
                              Navigator.push(context, 
                                MaterialPageRoute( 
                                  builder: (context) => LandingPage()),
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
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('Kreirajte Profil')
                      ),
                    )
                  ),
                ],
              ),
            )
          ],
          scrollDirection: Axis.vertical,
          ),
      )
    );
  }

  Future pickDate (BuildContext context) async {
    
    
    final birthDate = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(DateTime.now().year - 80),
      maxTime: DateTime(DateTime.now().year - 15)
    );

    if (birthDate == null) return;

    setState(() => {

      dateTime = birthDate,
      if(dateTime == null) {
        dateOfBithController.text = 'yyyy-dd-MM'
      } else {
        dateOfBithController.text = DateFormat('yyyy-dd-MM').format(dateTime)
      }
    });
  }
}

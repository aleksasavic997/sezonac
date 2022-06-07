import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../layout/drawer.dart';
import '../../../models/cityData.dart';
import '../../../services/APICities.dart';


class AddEditOfferForm extends StatefulWidget {

   @override
  _AddEditOfferForm createState() => _AddEditOfferForm();

    
}

  final offerNameController = TextEditingController();
  final offerDescriptionController = TextEditingController();
  final setStartingDate = TextEditingController();
  final setEndingDate = TextEditingController();
  final _formKey = GlobalKey<FormState>();

class _AddEditOfferForm extends State<AddEditOfferForm> {
    bool isValid = false;
    DateTimeRange dateRange;
    List<String> _apiCities = new List<String>();
    List<String> _selectedCities;

    handleSelectedCities(value) {
    setState(() {
      _selectedCities = value;
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Postavite Oglas'),
      ),
      body: Center(
         child: isValid ?
          Center(
            child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
          ) : ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                onChanged: () {
                  if(Form.of(primaryFocus.context) != null) {
                    Form.of(primaryFocus.context).save();
                  }   
                },
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: TextFormField(
                        controller: offerNameController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.account_box_rounded),
                          hintText: 'Unesite naziv oglasa koji postavljate',
                          labelText: 'Naziv Oglasa *',
                        ),
                        onSaved: (String value) {},
                        validator: (String value) {
                          if(value == null || value.isEmpty) {
                            return 'Polje je obavezno!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), 
                      child: TextFormField(
                        controller: offerDescriptionController,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.description_outlined),
                            hintText: 'Unesite kratak opis Vašeg oglasa',
                            labelText: 'Opis',
                          ),
                          minLines: 1,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          onSaved: (String value) {},
                          validator: (String value) {
                            if(value == null || value.isEmpty) {
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
                            return DropdownSearch<String>.multiSelection(
                                mode: Mode.MENU,
                                showSelectedItems: true,
                                items: _apiCities,
                                // ignore: deprecated_member_use
                                label: "Izaberite Lokaciju Oglasa",
                                onChanged: (value) {
                                  handleSelectedCities(value);
                              },
                              validator: (List<String> value) {
                                if (value == null || value.isEmpty) {
                                  return 'Morate izabrati lokaciju';
                                }
                                if(value.length > 1) {
                                  return 'Moguće je izabrati jednu lokaciju';
                                }
                                return null;
                              },
                            ); 
                            
                          }
                        }
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text('Izaberite period trajanja Vašeg oglasa'),

                    ), 
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: TextFormField(
                        controller: setStartingDate,
                         decoration: const InputDecoration(
                          icon: Icon(Icons.start_outlined),
                            hintText: 'Početni datum'
                          ),
                          enabled: true,
                          onTap: () {
                            FocusScope.of(context).requestFocus(new FocusNode());
                            pickDateRange(context);
                          },
                          onSaved: (String value) {},
                          validator: (String value) {
                            if(value == null || value.isEmpty) {
                              return 'Polje je obavezno!';
                            }
                            return null;
                          },
                      ),
                    ),   
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: TextFormField(
                        controller: setEndingDate,
                         decoration: const InputDecoration(
                            icon: Icon(Icons.exit_to_app_outlined),
                            hintText: 'Krajnji datum'
                          ),
                          enabled: true,
                          onTap: () {
                            FocusScope.of(context).requestFocus(new FocusNode());
                            pickDateRange(context);
                          },
                          onSaved: (String value) {},
                          validator: (String value) {
                            if(value == null || value.isEmpty) {
                              return 'Polje je obavezno!';
                            }
                            return null;
                          },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text('Naznačite način plaćanja kandidata. (Po satu, na mesečnom nivou, po odradjenom poslu).'),

                    ), 
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.contact_page),
                          labelText: 'Unesite način plaćanja i iznos *',
                        ),
                        onSaved: (String value) {},
                        validator: (String value) {
                          if(value == null || value.isEmpty) {
                            return 'Polje je obavezno!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text('Ukoliko Želite, možete uneti dodatni kontakt na koji se kandidati mogu javiti'),

                    ), 
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.contact_page),
                          hintText: 'Unesite Vaš kontakt-telefon, ili elektronski naslov',
                          labelText: 'Vaš kontakt',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child:  OutlinedButton(
                          onPressed: () {
                            setState(() {
              
                            });
                          },
                            style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text('Postavite Oglas')
                        ),
                      )
                    ),                
                  ],
                )
              )
            ],
          )
      ),
      drawer: NavigationDrawer(),
    );
  }

  Future pickDateRange (BuildContext context) async {

    final initialDateRange = DateTimeRange(
      start:  DateTime.now(), 
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );

    final newDateRange = await showDateRangePicker(
      context: context, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: dateRange ?? initialDateRange
    );

    if (newDateRange == null) return;

    setState(() => {
      dateRange = newDateRange,

      if(dateRange == null) {
        setStartingDate.text = 'MM/DD/YYYY',
        setEndingDate.text = 'MM/DD/YYYY'
      } else {
        setStartingDate.text = DateFormat('MM/dd/yyyy').format(dateRange.start).toString(),
        setEndingDate.text = DateFormat('MM/dd/yyyy').format(dateRange.end).toString()
      }
    });
  }

}


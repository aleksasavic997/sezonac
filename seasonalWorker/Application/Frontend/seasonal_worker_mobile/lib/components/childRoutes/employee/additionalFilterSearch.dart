import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seasonal_worker_mobile/components/childRoutes/registerEmployer.dart';
import 'package:seasonal_worker_mobile/services/APIJobAdvertisement.dart';
import '../../../layout/drawer.dart';
import '../../../models/areaOfActivity.dart';
import '../../../models/cityData.dart';
import '../../../services/APIAreaOfActivities.dart';
import '../../../services/APICities.dart';
import '../../landingPage.dart';
import 'employeeDashboard.dart';

class AdditionalFilterSearch extends StatefulWidget {
  @override
  _AdditionalFilterSearch createState() => _AdditionalFilterSearch();
}

class _AdditionalFilterSearch extends State<AdditionalFilterSearch> {
  AreaOfActivityData _selectedWorkingArea;
  List<CityData> _apiCities = new List<CityData>();
  CityData _selectedCity;
  DateTimeRange dateRange;
  String _additionalBenefits;
  bool isCheckedFood = false;
  bool isCheckedAccomodation = false;
  final _formKey = GlobalKey<FormState>();
  final setStartingDate = TextEditingController();
  final setEndingDate = TextEditingController();
  bool isValid = false;

  handleAreaSelect(value) {
    setState(() {
      _selectedWorkingArea = value;
    });
  }

  handleSelectedCities(value) {
    setState(() {
      _selectedCity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Napredna pretraga'),
      ),
      body: Center(
          child: isValid
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : ListView(children: <Widget>[
                  Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: () {
                        if (Form.of(primaryFocus.context) != null) {
                          Form.of(primaryFocus.context).save();
                        }
                      },
                      child: Wrap(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 32),
                            child: Text('Napredna pretraga oglasa',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: DropdownSearch<AreaOfActivityData>(
                              mode: Mode.MENU,
                              onFind: (String cityData) =>
                                  APIAreaOfActivities.getAllAreaOfActivities(),
                              itemAsString:
                                  (AreaOfActivityData areaOfActivityData) =>
                                      areaOfActivityData.getAreaOfActivityName,
                              // ignore: deprecated_member_use
                              label: "Izaberite oblast poslovanja",
                              onChanged: (value) {
                                handleAreaSelect(value);
                              },
                            )),
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
                                    );
                                  }
                                })),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text('Izaberite period angažovanja',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: TextFormField(
                            controller: setStartingDate,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.start_outlined),
                                hintText: 'Početni datum'),
                            enabled: true,
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              pickDateRange(context);
                            },
                            onSaved: (String value) {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: TextFormField(
                            controller: setEndingDate,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.exit_to_app_outlined),
                                hintText: 'Krajnji datum'),
                            enabled: true,
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              pickDateRange(context);
                            },
                            onSaved: (String value) {},
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: CheckboxListTile(
                                  title: Text('Obezbedjena hrana',
                                      style: TextStyle(fontSize: 16)),
                                  value: isCheckedFood,
                                  onChanged: (bool value) {
                                    setState(() {
                                      isCheckedFood = value;
                                    });
                                  },
                                )),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                child: CheckboxListTile(
                                  title: Text('Obezbedjen smeštaj',
                                      style: TextStyle(fontSize: 16)),
                                  value: isCheckedAccomodation,
                                  onChanged: (bool value) {
                                    setState(() {
                                      isCheckedAccomodation = value;
                                    });
                                  },
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: OutlinedButton(
                                  onPressed: () async {
                                    var filteredJobAdvertisements =
                                        await APIJobAdvertisements
                                            .getFilteredJobAdvertisement(
                                                _selectedWorkingArea == null
                                                    ? 0
                                                    : _selectedWorkingArea
                                                        .getId,
                                                _selectedCity == null
                                                    ? 0
                                                    : _selectedCity.getId,
                                                DateTime.parse(
                                                    dateRange.start.toString()),
                                                DateTime.parse(
                                                    dateRange.end.toString()),
                                                isCheckedFood,
                                                isCheckedAccomodation);
                                    if (filteredJobAdvertisements != null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardEmployee(),
                                          ));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Došlo je go greške.'),
                                          backgroundColor: Colors.redAccent,
                                        ),
                                      );
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  child: const Text('Pretražite')),
                            )),
                      ]))
                ])),
      drawer: NavigationDrawer(),
    );
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );

    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDateRange: dateRange ?? initialDateRange);

    if (newDateRange == null) return;

    setState(() => {
          dateRange = newDateRange,
          if (dateRange == null)
            {
              setStartingDate.text = 'MM/DD/YYYY',
              setEndingDate.text = 'MM/DD/YYYY'
            }
          else
            {
              setStartingDate.text =
                  DateFormat('MM/dd/yyyy').format(dateRange.start).toString(),
              setEndingDate.text =
                  DateFormat('MM/dd/yyyy').format(dateRange.end).toString()
            }
        });
  }
}

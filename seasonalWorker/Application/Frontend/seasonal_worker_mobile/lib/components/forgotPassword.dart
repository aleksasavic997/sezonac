import 'package:flutter/material.dart';
import '../layout/header.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key/*?*/ key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    double _headerHeight = 200;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zaboravljena Lozinka'),
      ),
      body: Center(
         child: Column(
           children: [
              Container(
                height: _headerHeight,
                child: Header(_headerHeight, true, Icons.password_sharp)
              ),
           ],
          )
      ),
    );
  }
}
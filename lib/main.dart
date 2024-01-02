import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/view/home_page.dart';
import 'package:state_management/view_model/home_view_model.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => HomeViewModel(),
        child: HomePage(),
      ),
    );
  }
}

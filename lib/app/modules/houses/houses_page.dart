import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/houses/houses_store.dart';
import 'package:flutter/material.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({Key? key}) : super(key: key);
  @override
  HousesPageState createState() => HousesPageState();
}
class HousesPageState extends State<HousesPage> {
  final HousesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
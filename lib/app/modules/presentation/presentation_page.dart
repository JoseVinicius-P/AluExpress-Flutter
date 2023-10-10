import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/presentation/presentation_store.dart';
import 'package:flutter/material.dart';

class PresentationPage extends StatefulWidget {
  final String title;
  const PresentationPage({Key? key, this.title = 'PresentationPage'}) : super(key: key);
  @override
  PresentationPageState createState() => PresentationPageState();
}
class PresentationPageState extends State<PresentationPage> {
  final PresentationStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
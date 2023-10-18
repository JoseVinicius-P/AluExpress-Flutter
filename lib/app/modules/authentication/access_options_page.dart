import 'package:flutter/material.dart';

class AccessOptionsPage extends StatefulWidget {
  final String title;
  const AccessOptionsPage({Key? key, this.title = 'AccessOptionsPage'}) : super(key: key);
  @override
  AccessOptionsPageState createState() => AccessOptionsPageState();
}
class AccessOptionsPageState extends State<AccessOptionsPage> {
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
import 'package:flutter/material.dart';

class CreateNewPasswordPage extends StatefulWidget {
  final String title;
  const CreateNewPasswordPage({Key? key, this.title = 'CreateNewPasswordPage'}) : super(key: key);
  @override
  CreateNewPasswordPageState createState() => CreateNewPasswordPageState();
}
class CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccessOptionsPage extends StatefulWidget {
  const AccessOptionsPage({Key? key}) : super(key: key);
  @override
  AccessOptionsPageState createState() => AccessOptionsPageState();
}
class AccessOptionsPageState extends State<AccessOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => SystemNavigator.pop(),
          icon: const Icon(Icons.close_rounded, color: Colors.black,),
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}
class CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox()
          ),
          Expanded(
              child: SizedBox()
          ),
          Expanded(
              child: SizedBox()
          ),
        ],
      ),
    );
  }
}
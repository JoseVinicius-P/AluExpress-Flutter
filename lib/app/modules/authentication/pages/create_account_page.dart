import 'package:flutter/material.dart';
import 'package:luguel/app/modules/authentication/widgets/title_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      body: Padding(
        padding: EdgeInsets.all(5.sw),
        child: Column(
          children: [
            TitleWidget(
              text: 'Criando sua \nconta',
              textAlign: TextAlign.left,
            ),
            Expanded(
                child: SizedBox()
            ),
            Expanded(
                child: SizedBox()
            ),
          ],
        ),
      ),
    );
  }
}
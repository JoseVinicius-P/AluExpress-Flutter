import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/authentication/widgets/options_access_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/title_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AccessOptionsPage extends StatefulWidget {
  const AccessOptionsPage({Key? key}) : super(key: key);
  @override
  AccessOptionsPageState createState() => AccessOptionsPageState();
}
class AccessOptionsPageState extends State<AccessOptionsPage> {

  var optionsAccessWidget = OptionsAccessWidget(
    onTapGoogleButton: (){},
    onTapSignEmailWithPassword: (){},
    onTapCreateAccount: () => Modular.to.pushNamed('./create_account'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.all(5.sw),
        child: OrientationLayoutBuilder(
          portrait: (context) => Column(
            children: [
              const TitleWidget(),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.bottomCenter,
                child: optionsAccessWidget,
              ),
            ],
          ),
          landscape: (context) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitleWidget(),
              optionsAccessWidget,
            ],
          ),
        ),

      ),
    );
  }
}
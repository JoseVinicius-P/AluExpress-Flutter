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

  @override
  Widget build(BuildContext context) {
    var optionsAccessWidget = OptionsAccessWidget(
      onTapGoogleButton: (){},
      onTapSignEmailWithPassword: () => Modular.to.pushNamed("./login"),
      onTapCreateAccount: () => Modular.to.pushNamed('./create_account'),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.all(5.sw),
        child: OrientationLayoutBuilder(
          portrait: (context) => Column(
            children: [
              const Expanded(
                child: TitleWidget(
                  textAlign: TextAlign.center,
                  text: "Como vamos\nentrar?",
                ),
              ),
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
              const Expanded(
                child: TitleWidget(
                  textAlign: TextAlign.center,
                  text: "Como vamos\nentrar?",
                ),
              ),
              optionsAccessWidget,
            ],
          ),
        ),

      ),
    );
  }
}
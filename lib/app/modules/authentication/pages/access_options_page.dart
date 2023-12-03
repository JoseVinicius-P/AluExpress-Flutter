import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/authentication/widgets/options_access_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/title_widget.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';
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
      onTapGoogleButton: () => Modular.to.navigate("./profile/"),
      onTapSignEmailWithPassword: () => Modular.to.pushNamed("./login"),
      onTapCreateAccount: () => Modular.to.pushNamed('./create_account'),
      onTapLoginAsVisitor: () => Modular.to.navigate("/home/"),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: MyEdgeInsets.getInsetsBelowStatusBar(context),
        child: OrientationLayoutBuilder(
          portrait: (context) => Column(
            children: [
              const Expanded(
                child: TitleWidget(
                  textAlign: TextAlign.center,
                  text: "Como vamos\nentrar?",
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: optionsAccessWidget,
                ),
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
              Flexible(child: optionsAccessWidget),
            ],
          ),
        ),
      ),
    );
  }
}
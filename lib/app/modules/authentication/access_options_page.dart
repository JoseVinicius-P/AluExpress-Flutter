import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () => SystemNavigator.pop(),
          icon: const Icon(Icons.close_rounded, color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.sw),
        child: OrientationLayoutBuilder(
          portrait: (context) => Column(
            children: [
              const TitleWidget(),
              OptionsAccessWidget(
                onTapGoogleButton: (){},
                onTapSignEmailWithPassword: (){},
                onTapCreateAccount: (){},
              ),
            ],
          ),
          landscape: (context) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitleWidget(),
              OptionsAccessWidget(
                onTapGoogleButton: (){},
                onTapSignEmailWithPassword: (){},
                onTapCreateAccount: (){},
              ),
            ],
          ),
        ),

      ),
    );
  }
}
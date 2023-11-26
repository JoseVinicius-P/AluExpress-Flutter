import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

class FillProfilePage extends StatefulWidget {
  const FillProfilePage({Key? key}) : super(key: key);
  @override
  FillProfilePageState createState() => FillProfilePageState();
}
class FillProfilePageState extends State<FillProfilePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Complete seu perfil",
          style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: ClipOval(
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                  const Image(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
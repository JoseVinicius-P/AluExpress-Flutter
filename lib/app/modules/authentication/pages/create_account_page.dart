import 'package:flutter/material.dart';
import 'package:luguel/app/modules/authentication/widgets/text_field_widget.dart';
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
                child: Column(
                  children: [
                    TextFieldWidget(
                        hint: 'Email',
                        enable: true,
                        icon: Icons.email_rounded,
                        keyboardType: TextInputType.emailAddress
                    ),
                    SizedBox(height: 5,),
                    TextFieldWidget(
                        hint: 'Senha',
                        enable: true,
                        icon: Icons.lock,
                        keyboardType: TextInputType.visiblePassword
                    )
                  ],
                )
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
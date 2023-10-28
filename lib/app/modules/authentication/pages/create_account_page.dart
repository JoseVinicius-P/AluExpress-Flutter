import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/authentication/widgets/divider_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/form_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/google_button_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/question_and_button_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/title_widget.dart';
import 'package:luguel/app/shared/default_button_widget.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}
class CreateAccountPageState extends State<CreateAccountPage> {

  var questionAndButton = QuestionAndButtonWidget(
    question: "Já tem uma conta?",
    buttonText: "Fazer Login",
    onPressed: () => Modular.to.pushReplacementNamed("./login"),
  );
  var form = FormWidget(
      onChangedEmail: (text){},
      onChangedPassword: (text){},
      onChangedRememberMe: (isChecked){},
  );
  var createAccountButton = DefaultButtonWidget(
    onTap: (){},
    text: 'Criar conta',
    backgroundColor: MyColors.primaryColor,
    textColor: Colors.white,
    shadow: true,
  );
  var googleButton = GoogleButtonWidget(onTap: (){}, withText: false,);
  final String title = 'Criar sua \nconta';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.sw),
        child: OrientationLayoutBuilder(
          portrait: (context) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const Flexible(child: SizedBox(height: 50,)),
                        // ignore: prefer_const_constructors
                        TitleWidget(
                          text: title,
                          textAlign: TextAlign.left,
                        ),
                        const Spacer(),
                        form,
                        createAccountButton,
                        const Spacer(),
                      ],
                    )
                ),
                Expanded(
                  flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const DividerWidget(text: "ou continue com"),
                        const Flexible(child: SizedBox(height: 15,)),
                        Row(mainAxisSize: MainAxisSize.min, children: [googleButton],
                        ),
                        const Flexible(child: SizedBox(height: 25,)),
                        questionAndButton,
                      ],
                    )
                ),
              ],
            );
          },
          landscape: (context) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: TitleWidget(
                    text: title,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        form,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(child: googleButton),
                            const SizedBox(width: 10,),
                            Flexible(
                              child: createAccountButton
                            ),

                          ],
                        ),
                        const Spacer(),
                        questionAndButton,
                      ],
                    )
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
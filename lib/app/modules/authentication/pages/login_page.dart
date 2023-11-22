import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/authentication/widgets/checkbox_remember_me_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/divider_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/form_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/google_button_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/question_and_button_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/title_widget.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';
import 'package:luguel/app/shared/widgets/default_button_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var questionAndButton = QuestionAndButtonWidget(
      question: "Não tem uma conta?",
      buttonText: "Criar agora",
      onPressed: () => Modular.to.pushReplacementNamed('./create_account'),
    );
    var form = FormWidget(
      onChangedEmail: (text){},
      onChangedPassword: (text){},
    );
    var checkboxRememberMe = ChekboxRememberMeWidget(
      checked: true,
      onChanged: (isChecked){},
    );
    var loginButton = DefaultButtonWidget(
      onTap: (){},
      text: 'Login',
      backgroundColor: MyColors.primaryColor,
      textColor: MyColors.textButtonColor,
      shadow: true,
    );
    var googleButton = GoogleButtonWidget(onTap: (){}, withText: false,);
    const String title = 'Entrar na sua \nconta';
    var forgotMyPasswordButton = TextButton(
      onPressed: () => Modular.to.pushNamed("./forgot_password"),
      child: AutoSizeText(
        "Esqueci minha senha",
        style: theme.textTheme.labelSmall!.copyWith(color: MyColors.primaryColor),
        maxLines: 1,
        softWrap: true,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: MyEdgeInsets.getInsetsBelowStatusBar(context),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: checkboxRememberMe),
                            Flexible(child: forgotMyPasswordButton)
                          ],
                        ),
                        const Flexible(child: SizedBox(height: 15,)),
                        loginButton,
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
                const Expanded(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: checkboxRememberMe),
                            Flexible(child: forgotMyPasswordButton)
                          ],
                        ),
                        const Flexible(child: SizedBox(height: 15,)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(child: googleButton),
                            const SizedBox(width: 10,),
                            Flexible(
                                child: loginButton
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
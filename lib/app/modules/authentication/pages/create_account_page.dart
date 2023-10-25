import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/modules/authentication/widgets/divider_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/google_button_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/text_field_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/title_widget.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}
class CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.sw),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const TitleWidget(
              text: 'Criando sua \nconta',
              textAlign: TextAlign.left,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TextFieldWidget(
                        hint: 'Email',
                        enable: true,
                        icon: Icons.email_rounded,
                        keyboardType: TextInputType.emailAddress
                    ),
                    const SizedBox(height: 5,),
                    const TextFieldWidget(
                        hint: 'Senha',
                        enable: true,
                        icon: Icons.lock,
                        keyboardType: TextInputType.visiblePassword
                    ),
                    ChekboxRememberMe(checked: true, onChanged: (isChecked){},)
                  ],
                )
            ),
            Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DividerWidget(text: "ou continue com"),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GoogleButtonWidget(onTap: (){}, withText: false,)
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            "Já tem uma conta?",
                            style: theme.textTheme.labelSmall!.copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
                            maxLines: 1,
                            softWrap: true,
                          ),
                        ),
                        Flexible(
                          child: TextButton(
                            onPressed: (){},
                            child: AutoSizeText(
                              "Fazer Login",
                              style: theme.textTheme.labelSmall!.copyWith(color: MyColors.primaryColor),
                              maxLines: 1,
                              softWrap: true,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

class ChekboxRememberMe extends StatefulWidget {
  const ChekboxRememberMe({
    super.key, required this.onChanged, required this.checked,
  });
  final Function(bool?) onChanged;
  final bool checked;

  @override
  State<ChekboxRememberMe> createState() => _ChekboxRememberMeState();
}

class _ChekboxRememberMeState extends State<ChekboxRememberMe> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.checked;
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0), // Personaliza o arredondamento
          ),
          side: const BorderSide(
            color: MyColors.primaryColor,
            width: 2,
          ),
          value: isChecked,
          activeColor: MyColors.primaryColor,
          onChanged: (isChecked){
            setState(() {
              this.isChecked = isChecked!;
            });
            widget.onChanged(isChecked);
          },
        ),
        AutoSizeText(
          "Lembrar de mim",
          style: theme.textTheme.labelSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          maxLines: 1,
        ),
      ],
    );
  }
}
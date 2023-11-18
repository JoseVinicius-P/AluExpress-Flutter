import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_new_password_store.dart';
import 'package:luguel/app/modules/authentication/widgets/floating_image_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/text_field_widget.dart';
import 'package:luguel/app/shared/default_button_widget.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({Key? key}) : super(key: key);
  @override
  CreateNewPasswordPageState createState() => CreateNewPasswordPageState();
}
class CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  var store = Modular.get<INewPasswordStore>();
  var focusNodeTextFieldConfirmPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var createPasswordButton = TripleBuilder(
      store: store,
      builder: (context, triple) {
        return DefaultButtonWidget(
          onTap: store.arePasswordsSame(triple.state as List<String>) ? (){} : null,
          text: "Criar senha",
          backgroundColor: MyColors.primaryColor,
          textColor: Colors.white,
          shadow: true,
          icon: const Icon(Icons.lock_reset_outlined, color: Colors.white,),
        );
      }
    );

    var instructionText = AutoSizeText(
      "Crie uma nova senha para sua conta!",
      style: theme.textTheme.labelSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
      textAlign: TextAlign.left,
    );

    var textFieldPassword = TextFieldWidget(
      hint: "Nova senha",
      enable: true,
      icon: Icons.lock,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (text) => store.setPassword(text),
      controller: store.passwordController,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_){
        FocusScope.of(context).requestFocus(focusNodeTextFieldConfirmPassword);
      },
    );

    var textFieldConfirmPassword = TextFieldWidget(
      hint: "Confirme a nova senha",
      enable: true,
      icon: Icons.lock,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (text) => store.setConfirmationPassword(text),
      controller: store.confirmPasswordController,
      focusNode: focusNodeTextFieldConfirmPassword,
    );

    var floatingPadlock = const FloatingImageWidget(assetImage: AssetImage('assets/images/security.png'));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Criar uma nova senha",
          style: theme.textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0, top: 15.0),
        child: OrientationLayoutBuilder(
          portrait: (context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  KeyboardVisibilityBuilder(
                    builder: (context, isKeyboardVisible) {
                      if(isKeyboardVisible){
                        return const SizedBox();
                      }else{
                        return Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              floatingPadlock,
                            ],
                          ),
                        );
                      }
                    }
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            instructionText,
                          ],
                        ),
                        const SizedBox(height: 25,),
                        textFieldPassword,
                        const SizedBox(height: 8,),
                        textFieldConfirmPassword,
                        const SizedBox(height: 20,),
                        createPasswordButton,
                        const SizedBox(height: 40,),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          landscape: (context) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        floatingPadlock,
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        instructionText,
                        const SizedBox(height: 25,),
                        textFieldPassword,
                        const SizedBox(width: 5,),
                        textFieldConfirmPassword,
                        const SizedBox(height: 25,),
                        createPasswordButton,
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
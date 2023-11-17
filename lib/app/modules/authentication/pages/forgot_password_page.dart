import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_forgot_password_store.dart';
import 'package:luguel/app/modules/authentication/stores/forgot_password_store.dart';
import 'package:luguel/app/modules/authentication/widgets/contact_method_dense_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/contact_method_widget%5D.dart';
import 'package:luguel/app/modules/authentication/widgets/floating_image_widget.dart';
import 'package:luguel/app/shared/default_button_widget.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}
class ForgotPasswordPageState extends State<ForgotPasswordPage> with TickerProviderStateMixin {
  var store = Modular.get<IForgotPasswordStore>();

  @override
  void dispose() {
    store.selectContactMethod(ForgotPasswordStore.noMethodSelected);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var buttonNext = TripleBuilder(
      store: store,
      builder: (context, triple) {
        return DefaultButtonWidget(
          onTap: triple.state! as int <= 1 ? () => Modular.to.pushReplacementNamed('./recovery_code') : null,
          text: "Enviar código",
          backgroundColor: MyColors.primaryColor,
          textColor: Colors.white,
          shadow: true,
          icon: const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white,),
        );
      }
    );
    var instructionText = AutoSizeText(
      "Selecione qual o contato você quer usar para redefinir sua senha.",
      style: theme.textTheme.labelSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
    );
    var floatingPadlock = const FloatingImageWidget(assetImage: AssetImage('assets/images/padlock2.png'));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Esqueci minha senha",
          style: theme.textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0),
        child: OrientationLayoutBuilder(
          portrait: (context) {
            return SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Center(
                          child: floatingPadlock,
                        ),
                        instructionText,
                        const SizedBox(height: 25,),
                        TripleBuilder(
                          store: store,
                          builder: (context, triple) {
                            return ContactMethodWidget(
                              icon: Icons.message_rounded,
                              nameOfContactMethod: "SMS",
                              contactMethod: "(62)  9 * * * - * * 94",
                              onTap: () => store.selectContactMethod(ForgotPasswordStore.smsMethod),
                              isSelected: triple.state == ForgotPasswordStore.smsMethod,
                            );
                          }
                        ),
                        const SizedBox(height: 8,),
                        TripleBuilder(
                          store: store,
                          builder: (context, triple) {
                            return ContactMethodWidget(
                              icon: Icons.email_rounded,
                              nameOfContactMethod: "email",
                              contactMethod: "josev*****@gmail.com",
                              onTap: () => store.selectContactMethod(ForgotPasswordStore.emailMethod),
                              isSelected: triple.state == ForgotPasswordStore.emailMethod,
                            );
                          }
                        ),
                        const SizedBox(height: 70,),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: buttonNext
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      instructionText,
                      const SizedBox(height: 25,),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TripleBuilder(
                              store: store,
                              builder: (context, triple) {
                                return ContactMethodDenseWidget(
                                  icon: Icons.message_rounded,
                                  nameOfContactMethod: "SMS",
                                  contactMethod: "(62)  9 * * * - * * 94",
                                  onTap: () => store.selectContactMethod(ForgotPasswordStore.smsMethod),
                                  isSelected: triple.state == ForgotPasswordStore.smsMethod,
                                );
                              }
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Expanded(
                            child: TripleBuilder(
                              store: store,
                              builder: (context, triple) {
                                return ContactMethodDenseWidget(
                                  icon: Icons.email_rounded,
                                  nameOfContactMethod: "Email",
                                  contactMethod: "jos*******@gmail.com",
                                  onTap: () => store.selectContactMethod(ForgotPasswordStore.emailMethod),
                                  isSelected: triple.state == ForgotPasswordStore.emailMethod,
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25,),
                      buttonNext,
                    ],
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
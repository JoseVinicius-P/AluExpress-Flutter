import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_resend_code_store.dart';
import 'package:luguel/app/modules/authentication/interfaces/i_verify_code_store.dart';
import 'package:luguel/app/modules/authentication/widgets/resend_code_widget.dart';
import 'package:luguel/app/shared/widgets/default_button_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/widgets/flexible_sized_box.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RecoveryCodePage extends StatefulWidget {
  const RecoveryCodePage({Key? key}) : super(key: key);
  @override
  RecoveryCodePageState createState() => RecoveryCodePageState();
}
class RecoveryCodePageState extends State<RecoveryCodePage> {
  var resendCodeStore = Modular.get<IResendCodeStore>();
  var verifyCodeStore = Modular.get<IVerifyCodeStore>();

  @override
  void initState() {
    super.initState();
    resendCodeStore.startCountdown();
  }

  @override
  void dispose() {
    verifyCodeStore.setCode("");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var instructionText = AutoSizeText(
      "Digite o código enviado para jos*******@gmail.com",
      style: theme.textTheme.labelSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
    );
    final defaultPinTheme = PinTheme(
      width: 65,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grayLight),
        color: MyColors.grayLight.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: MyColors.primaryColor.withOpacity(0.1),
      border: Border.all(color: MyColors.primaryColor),
      borderRadius: BorderRadius.circular(10),
    );

    final pinput = Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      toolbarEnabled: false,
      onChanged: (code) => verifyCodeStore.setCode(code),
      errorBuilder: (_, s) => const SizedBox(),
    );

    var resendCode = TripleBuilder(
      store: resendCodeStore,
      builder: (context, triple) {
        return ResendCodeWidget(
          onTapResendCode: (){
            resendCodeStore.startCountdown();
          },
          countdownSeconds: triple.state as int,
        );
      }
    );

    var verifyCodeButton = TripleBuilder(
      store: verifyCodeStore,
      builder: (context, triple) {
        String code = triple.state as String;
        return DefaultButtonWidget(
          onTap: code.length == 4 ? () => Modular.to.pushReplacementNamed("./create_new_password") : null,
          text: "Verificar",
          backgroundColor: MyColors.primaryColor,
          textColor: Colors.white,
          icon: const Icon(Icons.done_rounded, color: Colors.white,),
          shadow: true,
        );
      }
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Esqueci minha senha",
          style: theme.textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 30.0, left: 15.0, right: 15.0),
        child: OrientationLayoutBuilder(
          portrait: (context){
            return Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      instructionText,
                      const FlexibleSizedBox(height: 40,),
                      pinput,
                      const FlexibleSizedBox(height: 40,),
                      resendCode,
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: verifyCodeButton,
                )
              ],
            );
          },
          landscape: (context){
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    instructionText,
                    const FlexibleSizedBox(height: 40,),
                    pinput,
                    const FlexibleSizedBox(height: 40,),
                    resendCode,
                    const FlexibleSizedBox(height: 40,),
                    SizedBox(
                      width: 100.sw,
                      child: verifyCodeButton
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
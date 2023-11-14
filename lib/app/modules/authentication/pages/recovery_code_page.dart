import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/modules/authentication/widgets/resend_code_widget.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:luguel/app/shared/widgets/flexible_sized_box.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RecoveryCodePage extends StatefulWidget {
  const RecoveryCodePage({Key? key}) : super(key: key);
  @override
  RecoveryCodePageState createState() => RecoveryCodePageState();
}
class RecoveryCodePageState extends State<RecoveryCodePage> {
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
      validator: (correctPin) {
        return "";
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      toolbarEnabled: false,
      onCompleted: (pin) => debugPrint(pin),
      errorBuilder: (_, s) => const SizedBox(),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Esqueci minha senha",
          style: theme.textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 25),
        ),
      ),
      body: OrientationLayoutBuilder(
        portrait: (context){
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                instructionText,
                const FlexibleSizedBox(height: 40,),
                pinput,
                const FlexibleSizedBox(height: 40,),
                ResendCodeWidget(
                  onTapResendCode: (){},
                  countdownSeconds: 60,
                ),
              ],
            ),
          );
        },
        landscape: (context){
          return SizedBox();
        },
      ),
    );
  }
}
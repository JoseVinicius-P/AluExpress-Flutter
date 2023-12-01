import 'package:flutter/material.dart';
import 'package:luguel/app/modules/authentication/widgets/text_field_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';
import 'package:luguel/app/shared/widgets/default_button_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FillProfilePage extends StatefulWidget {
  const FillProfilePage({Key? key}) : super(key: key);
  @override
  FillProfilePageState createState() => FillProfilePageState();
}
class FillProfilePageState extends State<FillProfilePage> {
  var focusNodeTextFieldPhoneNumber = FocusNode();

  @override
  void dispose() {
    focusNodeTextFieldPhoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.close_rounded, color: MyColors.textColor,),
        ),
        title: Text(
          "Complete seu perfil",
          style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 25),
        ),
      ),
      body: OrientationLayoutBuilder(
        portrait: (context) {
          return SafeArea(
            child: Padding(
              padding: MyEdgeInsets.standard,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5,),
                  Center(
                    child: SizedBox(
                      width: 40.sw,
                      height: 40.sw,
                      child: const AvatarWidget(
                        placeholder: AssetImage('assets/images/profile.png'),
                        avatarImage: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  TextFieldWidget(
                    hint: "Nome completo",
                    keyboardType: TextInputType.text,
                    icon: Icons.person_rounded,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_){
                      FocusScope.of(context).requestFocus(focusNodeTextFieldPhoneNumber);
                    },
                  ),
                  TextFieldWidget(
                    hint: "Telefone",
                    icon: Icons.phone_rounded,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    focusNode: focusNodeTextFieldPhoneNumber,
                    maskFormatter: MaskTextInputFormatter(mask: "(##) # ####-####"),
                  ),
                  const Spacer(),
                  DefaultButtonWidget(
                    onTap: (){},
                    text: "Continuar",
                    backgroundColor: MyColors.primaryColor,
                    textColor: MyColors.textButtonColor,
                    shadow: true,
                  )
                ],
              ),
            ),
          );
        },
        landscape: (context) {
          return SafeArea(
            child: Padding(
              padding: MyEdgeInsets.standard,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: 40.sw,
                          height: 40.sw,
                          child: const AvatarWidget(
                            placeholder: AssetImage('assets/images/profile.png'),
                            avatarImage: AssetImage('assets/images/profile.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 35,),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextFieldWidget(
                              hint: "Nome completo",
                              keyboardType: TextInputType.text,
                              icon: Icons.person_rounded,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_){
                                FocusScope.of(context).requestFocus(focusNodeTextFieldPhoneNumber);
                              },
                            ),
                            TextFieldWidget(
                              hint: "Telefone",
                              icon: Icons.phone_rounded,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              focusNode: focusNodeTextFieldPhoneNumber,
                              maskFormatter: MaskTextInputFormatter(mask: "(##) # ####-####"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40,),
                  SizedBox(
                    width: 100.sw,
                    child: DefaultButtonWidget(
                      onTap: (){},
                      text: "Continuar",
                      backgroundColor: MyColors.primaryColor,
                      textColor: MyColors.textButtonColor,
                      shadow: true,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key, required this.placeholder, required this.avatarImage,
  });

  final AssetImage placeholder;
  final ImageProvider avatarImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: Image(
            image: placeholder,
            fit: BoxFit.cover,
          ),
        ),
        ClipOval(
          child: Image(
            image: avatarImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 0,
          child: InkWell(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.edit_rounded, color: Colors.white,),
              ),
            ),
          ),
        )
      ],
    );
  }
}
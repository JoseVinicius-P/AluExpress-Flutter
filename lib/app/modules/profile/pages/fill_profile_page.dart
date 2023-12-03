import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:luguel/app/modules/authentication/widgets/text_field_widget.dart';
import 'package:luguel/app/modules/profile/widgets/checkbox_whatsapp_widget.dart';
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
  final List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  final _scrollController = ScrollController();
  late StreamSubscription<bool> keyboardSubscription;
  FocusNode focusNodeTextFieldPhoneNumber = FocusNode();

  @override
  void initState() {
    super.initState();
    listenKeyboard();
  }

  void listenKeyboard(){
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      if(visible){
        _scrollController.jumpTo(_scrollController.position.extentTotal);
      }
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    focusNodeTextFieldPhoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textFieldFullName = TextFieldWidget(
      hint: "Nome completo",
      keyboardType: TextInputType.text,
      icon: Icons.person_rounded,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_){
        FocusScope.of(context).requestFocus(focusNodeTextFieldPhoneNumber);
      },
    );
    var textFieldPhoneNumber = TextFieldWidget(
      hint: "Telefone",
      icon: Icons.phone_rounded,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      focusNode: focusNodeTextFieldPhoneNumber,
      maskFormatter: MaskTextInputFormatter(mask: "(##) # ####-####"),
    );
    var checkBoxWhatsApp = CheckboxWhatsAppWidget(onChanged: (isChecked){}, checked: true);
    var dropDownMenuState = DropdownMenuWidget(
      list: list,
      hint: "Estado",
      onSelected: (item) => debugPrint(item),
      width: 100.sw - MyEdgeInsets.standard.right * 2,
    );
    var dropDownMenuCity = DropdownMenuWidget(
      list: list,
      hint: "Cidade",
      onSelected: (item) => debugPrint(item),
      width: 100.sw - MyEdgeInsets.standard.right * 2,
    );
    var buttonNext = DefaultButtonWidget(
      onTap: (){},
      text: "Continuar",
      backgroundColor: MyColors.primaryColor,
      textColor: MyColors.textButtonColor,
      shadow: false,
    );
    var avatarImage = SizedBox(
      width: 40.sw,
      height: 40.sw,
      child: const AvatarWidget(
        placeholder: AssetImage('assets/images/profile.png'),
        avatarImage: AssetImage('assets/images/profile.png'),
      ),
    );

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
          focusNodeTextFieldPhoneNumber = FocusNode();
          return SafeArea(
            child: Padding(
              padding: MyEdgeInsets.standard,
              child: Stack(
                children: [
                  Scaffold(
                    resizeToAvoidBottomInset: true,
                    body: SingleChildScrollView(
                      controller: _scrollController,
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom/2,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 5,),
                          Center(
                            child: avatarImage,
                          ),
                          const SizedBox(height: 25,),
                          textFieldFullName,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 2,
                                child: textFieldPhoneNumber
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  children: [
                                    checkBoxWhatsApp,
                                    //Esse text alinha a check box no centro do textfield, não deve ser tirado
                                    const Text(
                                      " ",
                                      style: TextStyle(
                                          color: MyColors.errorColor
                                      ),
                                    )
                                  ],
                                )
                              ),
                            ],
                          ),
                          dropDownMenuState,
                          const SizedBox(height: 25,),
                          dropDownMenuCity,
                          const SizedBox(height: 80,),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      buttonNext
                    ],
                  )
                ],
              ),
            ),
          );
        },
        landscape: (context) {
          focusNodeTextFieldPhoneNumber = FocusNode();
          return SafeArea(
            child: Center(
              child: SizedBox(
                width: 100.sw,
                child: Padding(
                  padding: MyEdgeInsets.standard.copyWith(top: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 5,),
                        Center(
                          child: avatarImage,
                        ),
                        const SizedBox(height: 25,),
                        textFieldFullName,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                flex: 2,
                                child: textFieldPhoneNumber
                            ),
                            Flexible(
                                flex: 1,
                                child: Column(
                                  children: [
                                    checkBoxWhatsApp,
                                    //Esse text alinha a check box no centro do textfield, não deve ser tirado
                                    const Text(
                                      " ",
                                      style: TextStyle(
                                          color: MyColors.errorColor
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                        dropDownMenuState,
                        const SizedBox(height: 25,),
                        dropDownMenuCity,
                        const SizedBox(height: 25,),
                        buttonNext,
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
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
        ),
      ],
    );
  }
}

class DropdownMenuWidget extends StatefulWidget {
  final List<String> list;
  final String hint;
  final Function(String) onSelected;
  final double width;

  const DropdownMenuWidget({super.key, required this.list, required this.hint, required this.onSelected, required this.width});

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  late String dropdownValue;
  final TextEditingController controller = TextEditingController();
  String selected = "";

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DropdownMenu<String>(
      width: widget.width,
      controller: controller,
      enableFilter: true,
      requestFocusOnTap: true,
      hintText: widget.hint,
      textStyle: theme.textTheme.labelSmall!.copyWith(color: MyColors.textColor),
      inputDecorationTheme: InputDecorationTheme(
        isDense: false,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 17.0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15),
        ),
        focusColor: MyColors.primaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: MyColors.grayLight,
        hintStyle: theme.textTheme.labelSmall!.copyWith(color: Colors.grey),
      ),
      onSelected: (String? item) {
        if(item != null){
          setState(() {
            selected = item;
          });
          widget.onSelected(item);
        }else{
          setState(() {
            selected = "";
          });
        }
      },
      dropdownMenuEntries:
      widget.list.map<DropdownMenuEntry<String>>(
            (String item) {
          return DropdownMenuEntry<String>(
            value: item,
            label: item,
          );
        },
      ).toList(),
    );
  }
}
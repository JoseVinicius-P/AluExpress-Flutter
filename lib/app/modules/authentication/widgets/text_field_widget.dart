import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldWidget extends StatefulWidget {
  final String hint;
  final bool enable;
  final String? error;
  final MaskTextInputFormatter? maskFormatter;
  final IconData icon;
  final TextInputType keyboardType;
  final int? maxLength;
  final TextEditingController? controller;

  const TextFieldWidget({
    Key? key,
    required this.hint,
    this.maskFormatter,
    required this.enable,
    required this.icon,
    required this.keyboardType,
    this.maxLength,
    this.controller,
    this.error
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final FocusNode _focusNode = FocusNode();
  String text = "";

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Importante descartar o FocusNode ao final
    super.dispose();
  }

  Color getColor(){
    if(widget.error != null){
      return Colors.red;
    }else if(_focusNode.hasFocus){
      return MyColors.primaryColor;
    }else if(text.isEmpty){
      return Colors.grey;
    }else{
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          enabled: widget.enable,
          inputFormatters: widget.maskFormatter != null ?
          [
            widget.maskFormatter!,
            LengthLimitingTextInputFormatter(widget.maxLength),
          ] :
          [
            LengthLimitingTextInputFormatter(widget.maxLength)
          ],
          keyboardType: widget.keyboardType,
          onChanged: (text){
            setState(() {
              this.text = text;
            });
          },
          focusNode: _focusNode,
          //definindo estilo do texto
          style: theme.textTheme.labelSmall!.copyWith(color: Colors.black),
          cursorColor: Colors.black,
          //retirando autocorreção de texto
          autocorrect: false,
          //definindo estilo do container do textfield
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 17.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: MyColors.primaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
            fillColor: _focusNode.hasFocus ? MyColors.secondaryColor : MyColors.grayLight,
            //Definindo hint usando varivel da classe personalizada MyStrings
            hintText: widget.hint,
            hintStyle: theme.textTheme.labelSmall!.copyWith(color: getColor()),
            prefixIcon: Icon(widget.icon, color: getColor()),
            filled: true,
          ),
        ),
        const SizedBox(height: 5,),
        Text(
        widget.error != null && widget.error != "" ? "     *${widget.error}" : "",
          style: const TextStyle(
            color: Colors.red
          ),
        )
      ],
    );
  }
}
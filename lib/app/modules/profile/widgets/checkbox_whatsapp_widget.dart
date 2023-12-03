import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

class CheckboxWhatsAppWidget extends StatefulWidget {
  const CheckboxWhatsAppWidget({
    super.key, required this.onChanged, required this.checked,
  });
  final Function(bool?) onChanged;
  final bool checked;

  @override
  State<CheckboxWhatsAppWidget> createState() => _CheckboxWhatsAppWidgetState();
}

class _CheckboxWhatsAppWidgetState extends State<CheckboxWhatsAppWidget> {
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
          "WhatsApp",
          style: theme.textTheme.labelSmall!.copyWith(color: MyColors.textColor, fontWeight: FontWeight.bold),
          maxLines: 1,
        ),
      ],
    );
  }
}
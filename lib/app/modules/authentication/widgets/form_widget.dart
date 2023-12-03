import 'package:flutter/material.dart';
import 'package:luguel/app/shared/widgets/text_field_widget.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.onChangedEmail,
    required this.onChangedPassword,
  });

  final void Function(String) onChangedEmail;
  final Function(String) onChangedPassword;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFieldWidget(
          hint: 'Email',
          enable: true,
          prefixIcon: Icons.email_rounded,
          keyboardType: TextInputType.emailAddress,
          onChanged: (text) => onChangedEmail(text),
        ),
        const SizedBox(height: 5,),
        TextFieldWidget(
          hint: 'Senha',
          enable: true,
          prefixIcon: Icons.lock,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (text) => onChangedPassword(text),
        ),
      ],
    );
  }
}
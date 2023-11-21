import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AlertDialogNewPasswordCreatedWidget extends StatelessWidget {
  const AlertDialogNewPasswordCreatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme =  Theme.of(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
            child: Image(
              image: const AssetImage('assets/images/done.png'),
              width: 25.sw,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            'Parabéns!',
            style: theme.textTheme.titleLarge!.copyWith(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Text(
            'Sua conta está pronta para ser usada!',
            style: theme.textTheme.labelSmall!.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(35),
            onTap: () => Navigator.of(context).pop(true),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35),
                  ),
                  border: Border.all(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Colors.transparent,
                  ),
                  color: MyColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.primaryColor.withOpacity(0.4),
                      spreadRadius: 0.1,
                      blurRadius: 15,
                      offset: const Offset(2, 10),
                    ),
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        maxLines: 1,
                        "Ir para o login",
                        style: theme.textTheme.labelSmall?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

class ContactMethodWidget extends StatelessWidget {
  const ContactMethodWidget({
    super.key,
    this.isSelected,
    required this.icon,
    required this.nameOfContactMethod,
    required this.contactMethod,
    required this.onTap,
  });

  final bool? isSelected;
  final IconData icon;
  final String nameOfContactMethod;
  final String contactMethod;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: isSelected ?? false ? MyColors.primaryColor : MyColors.grayLight,
              width: 2
          ),
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.primaryColor.withOpacity(0.05),
              ),
              padding: const EdgeInsets.all(25),
              child: Icon(icon, color: MyColors.primaryColor,),
            ),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Via $nameOfContactMethod:",
                  style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 8,),
                AutoSizeText(
                  contactMethod,
                  style: theme.textTheme.labelSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
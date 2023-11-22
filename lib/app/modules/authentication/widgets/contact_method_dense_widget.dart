
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

class ContactMethodDenseWidget extends StatelessWidget {
  const ContactMethodDenseWidget({
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
        padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.primaryColor.withOpacity(0.05),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Icon(icon, color: MyColors.primaryColor,),
                  ),
                  const SizedBox(height: 8,),
                  AutoSizeText(
                    "Via $nameOfContactMethod:",
                    style: theme.textTheme.labelSmall?.copyWith(color: MyColors.grey, fontWeight: FontWeight.normal),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8,),
                  AutoSizeText(
                    contactMethod,
                    style: theme.textTheme.labelSmall?.copyWith(color: MyColors.textColor, fontWeight: FontWeight.normal),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

class SimpleFilterItemWidget extends StatelessWidget {
  final String textFilter;
  final void Function() onTap;
  final bool isSelected;

  const SimpleFilterItemWidget({
    super.key, required this.textFilter, required this.onTap, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: MyColors.primaryColor
            ),
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? MyColors.primaryColor : Colors.white
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Text(
          textFilter,
          style: theme.textTheme.labelSmall!.copyWith(color: isSelected ? Colors.white : MyColors.primaryColor),
        ),
      ),
    );
  }
}
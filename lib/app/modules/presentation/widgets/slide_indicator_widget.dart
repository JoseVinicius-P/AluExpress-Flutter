import 'package:flutter/material.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SlideIndicatorWidget extends StatelessWidget {
  const SlideIndicatorWidget({
    super.key,
    required this.numberOfItems,
    this.onItemTap,
    required this.seletedItem,
    required this.axis,
  });

  final int numberOfItems;
  final void Function(int)? onItemTap;
  final int seletedItem;
  final Axis axis;

  List<Widget> generateItems(){
    return List.generate(numberOfItems, (index) =>
        GestureDetector(
          onTap: onItemTap != null ? () => onItemTap!(index) : (){},
          child: Container(
            width: 1.sh,
            height: 1.sh,
            margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.primaryColor.withOpacity(seletedItem == index ? 0.7 : 0.1)
            ),
          ),
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context){
        if(axis == Axis.horizontal){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: generateItems(),
          );
        }else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: generateItems(),
          );
        }
      },
    );
  }
}
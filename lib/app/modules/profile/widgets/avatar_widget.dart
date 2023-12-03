import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

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
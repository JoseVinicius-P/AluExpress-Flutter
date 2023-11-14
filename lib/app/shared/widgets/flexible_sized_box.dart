import 'package:flutter/cupertino.dart';

class FlexibleSizedBox extends StatelessWidget {
  const FlexibleSizedBox({Key? key, this.height, this.width}) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: SizedBox(height: height, width: width,)
    );
  }
}

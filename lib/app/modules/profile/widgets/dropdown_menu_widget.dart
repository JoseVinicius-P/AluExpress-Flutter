import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

class DropdownMenuWidget extends StatefulWidget {
  final List<String> list;
  final String hint;
  final Function(String) onSelected;
  final double width;

  const DropdownMenuWidget({super.key, required this.list, required this.hint, required this.onSelected, required this.width});

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  late String dropdownValue;
  final TextEditingController controller = TextEditingController();
  String selected = "";

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DropdownMenu<String>(
      width: widget.width,
      controller: controller,
      enableFilter: true,
      requestFocusOnTap: true,
      hintText: widget.hint,
      textStyle: theme.textTheme.labelSmall!.copyWith(color: MyColors.textColor),
      inputDecorationTheme: InputDecorationTheme(
        isDense: false,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 17.0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15),
        ),
        focusColor: MyColors.primaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: MyColors.grayLight,
        hintStyle: theme.textTheme.labelSmall!.copyWith(color: Colors.grey),
      ),
      onSelected: (String? item) {
        if(item != null){
          setState(() {
            selected = item;
          });
          widget.onSelected(item);
        }else{
          setState(() {
            selected = "";
          });
        }
      },
      dropdownMenuEntries:
      widget.list.map<DropdownMenuEntry<String>>(
            (String item) {
          return DropdownMenuEntry<String>(
            value: item,
            label: item,
          );
        },
      ).toList(),
    );
  }
}
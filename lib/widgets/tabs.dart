import 'package:flutter/material.dart';
import 'package:travel_app_ui/widgets/big_text.dart';

class Tabs extends StatelessWidget {
  final String tabName;
  final bool isSelected;
  final void Function()? onTap;

  const Tabs({
    super.key,
    required this.tabName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        child: GestureDetector(
          onTap: () => onTap,
          child: Card(
            margin: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
            color: isSelected ? Colors.white : Colors.grey[200],
            child: Center(
                child: BigText(
                    text: tabName, fontSize: 16, fontWeight: FontWeight.w400)),
          ),
        ));
  }
}

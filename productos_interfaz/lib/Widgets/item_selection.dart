import 'package:flutter/material.dart';

import 'item_icon.dart';

class ItemSelection extends StatefulWidget {
  int indexSelection;
  double height;
  double width;
  Function(int) onSelectIndex;
  ItemSelection({
    super.key,
    required this.indexSelection,
    required this.height,
    required this.onSelectIndex,
    required this.width,
  });

  @override
  State<ItemSelection> createState() => _ItemSelectionState();
}

class _ItemSelectionState extends State<ItemSelection> {
  int indexSelection = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.onSelectIndex(0);
              this.indexSelection = 0;
            });
          },
          child: ItemIcon(
            activeColor: Colors.black,
            desactiveColor: Colors.grey,
            isActive: this.indexSelection == 0,
            icon: Icons.home,
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.onSelectIndex(1);
            setState(() {
              this.indexSelection = 1;
            });
          },
          child: ItemIcon(
            activeColor: Colors.black,
            desactiveColor: Colors.grey,
            isActive: this.indexSelection == 1,
            icon: Icons.delete,
          ),
        ),
      ],
    );
  }
}

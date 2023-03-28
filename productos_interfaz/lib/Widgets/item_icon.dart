import 'package:flutter/material.dart';

class ItemIcon extends StatefulWidget {
  Color desactiveColor;
  Color activeColor;
  bool isActive;
  IconData icon;

  ItemIcon({
    super.key,
    required this.activeColor,
    required this.desactiveColor,
    required this.isActive,
    required this.icon,
  });

  @override
  State<ItemIcon> createState() => _ItemIconState();
}

class _ItemIconState extends State<ItemIcon> {
  Color getColorBorder(bool isActive) {
    if (isActive) {
      return widget.activeColor;
    } else {
      return widget.desactiveColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 19,
      ),
      height: 56,
      width: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: getColorBorder(widget.isActive),
        ),
      ),
      child: Icon(
        widget.icon,
        color: getColorBorder(widget.isActive),
      ),
    );
  }
}

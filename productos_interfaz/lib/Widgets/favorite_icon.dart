import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  final IconData iconData;
  final Color defaultColor;
  final Color pressedColor;
  final bool isFavorited;
  FavoriteIcon({
    super.key,
    required this.iconData,
    required this.defaultColor,
    required this.pressedColor,
    required this.isFavorited,
  });

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isFavorited = false;

  void _onPressed() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.iconData,
        size: 25,
      ),
      onPressed: _onPressed,
      color: _isFavorited ? widget.pressedColor : widget.defaultColor,
    );
  }
}

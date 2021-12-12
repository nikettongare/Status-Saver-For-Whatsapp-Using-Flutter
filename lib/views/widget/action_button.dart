import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final String toolTip;
  const ActionButton(
      {required this.onPressed,
      required this.icon,
      required this.size,
      required this.toolTip,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTip,
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        minWidth: 50,
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.zero,
        child: Center(
          child: Icon(
            icon,
            size: size,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

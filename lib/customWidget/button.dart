import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final Color textColor;
  final BorderRadius borderRadius;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsets padding;
  final bool hasSplash;

  Button(
      {@required this.onPressed,
      @required this.child,
      this.color = Colors.transparent,
      this.textColor,
      this.borderRadius = BorderRadius.zero,
      this.borderColor = Colors.transparent,
      this.borderWidth = 0,
      this.padding = EdgeInsets.zero,
      this.hasSplash = true});

  @override
  Widget build(BuildContext context) {
    /**
        return Theme(
        data: ThemeData(
        buttonTheme: ButtonThemeData(
        minWidth: 0,
        height: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
        child: FlatButton(
        onPressed: onPressed,
        child: child,
        color: color,
        textColor: textColor,
        padding: padding,
        splashColor: hasSplash ? null : Colors.transparent,
        highlightColor: hasSplash ? null : Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        );
     */

    BorderSide side = (borderColor == Colors.transparent || borderWidth == 0)
        ? BorderSide.none
        : BorderSide(color: borderColor, width: borderWidth);
    return ButtonTheme(
      minWidth: 0,
      height: 0,
      shape: RoundedRectangleBorder(borderRadius: borderRadius, side: side),
      child: FlatButton(
          onPressed: onPressed,
          child: child,
          color: color,
          textColor: textColor,
          padding: padding,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashColor: hasSplash ? null : Colors.transparent,
          highlightColor: hasSplash ? null : Colors.transparent),
    );
  }
}

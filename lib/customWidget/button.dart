import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final Color textColor;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final bool hasSplash;

  Button(
      {@required this.onPressed,
      @required this.child,
      this.color = Colors.transparent,
      this.textColor,
      this.borderRadius = BorderRadius.zero,
      this.padding = EdgeInsets.zero,
      this.hasSplash = true});

  @override
  Widget build(BuildContext context) {
    /* iOS style
	  return CupertinoButton(
		  onPressed: onPressed,
		  child: child,
		  color: color,
		  pressedOpacity: pressedOpacity,
		  borderRadius: borderRadius,
		  minSize: 0,
		  padding: padding,
	  );
  	 */

    /**
		 * Reset buttonTheme in the MaterialApp.theme object
		 *
		 * buttonTheme: ButtonThemeData(
			minWidth: 0,
			height: 0,
			materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)
		 */
    return FlatButton(
      onPressed: onPressed,
      child: child,
      color: color,
      textColor: textColor,
      padding: padding,
      splashColor: hasSplash ? null : Colors.transparent,
      highlightColor: hasSplash ? null : Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
    );
  }
}

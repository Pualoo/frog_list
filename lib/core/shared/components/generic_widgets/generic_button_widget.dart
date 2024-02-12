import 'package:flutter/material.dart';
import 'package:frog_list/core/config/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

enum GenericButtonColorScheme {
  blue,
  white,
  light,
}

class GenericButtonWidget extends StatefulWidget {
  const GenericButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    this.buttonPercentWidthSize = 0.7,
    this.hasColoredBorder = false,
    this.colorScheme = GenericButtonColorScheme.blue,
    this.icon,
    this.iconSize = 20,
    this.fontSize = 16,
  });
  final Function()? onPressed;
  final String text;
  final double fontSize;
  final IconData? icon;
  final double iconSize;
  final double buttonPercentWidthSize;
  final bool hasColoredBorder;
  final GenericButtonColorScheme colorScheme;

  @override
  State<GenericButtonWidget> createState() => _GenericButtonWidgetState();
}

class _GenericButtonWidgetState extends State<GenericButtonWidget> {
  Color getLivButtonBackGroundColor() {
    switch (widget.colorScheme) {
      case GenericButtonColorScheme.white:
        return Colors.white;
      case GenericButtonColorScheme.light:
        return lightColor;
      default:
        return Theme.of(context).primaryColor;
    }
  }

  Color getLivButtonPrimaryColor() {
    switch (widget.colorScheme) {
      case GenericButtonColorScheme.white:
        return Theme.of(context).primaryColor;
      case GenericButtonColorScheme.light:
        return Theme.of(context).primaryColor;
      default:
        return Colors.white;
    }
  }

  @override
  ElevatedButton build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final backgroundColor = getLivButtonBackGroundColor();
    final primaryColor = getLivButtonPrimaryColor();
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          side: widget.hasColoredBorder
              ? BorderSide(
                  width: 2, // thickness
                  color: primaryColor, // color
                )
              : BorderSide.none,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: SizedBox(
        width: screenSize.width * widget.buttonPercentWidthSize,
        height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(builder: (context) {
              if (widget.icon != null) {
                return Icon(
                  widget.icon,
                  size: widget.iconSize,
                  color: widget.onPressed != null ? primaryColor : Colors.grey,
                );
              }
              return Container();
            }),
            Text(
              widget.text,
              style: GoogleFonts.inter(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: widget.iconSize,
            ),
          ],
        ),
      ),
    );
  }
}

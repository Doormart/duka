import 'package:duka/core/utilities/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:duka/core/utilities/color_asset.dart';

class PrimaryButton extends StatelessWidget {
  final ButtonConfig buttonConfig;
  final double height;
  final EdgeInsets? margin;
  final double width;
  final Color color, textColor;

  const PrimaryButton(
      {Key? key,
        required this.buttonConfig,
        this.height = 54.0,
        this.margin,
        this.width = double.infinity,
        this.textColor = Colors.white,
        this.color = Palette.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Container(
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: buttonConfig.disabled ? Palette.staleWhite : color,
        borderRadius: BorderRadius.circular(SizeMg.radius(10),),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: buttonConfig.disabled ? null : buttonConfig.action,
          highlightColor: Palette.primaryColor.withOpacity(0.3),
          child: Center(
            child: Text(
              buttonConfig.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: buttonConfig.disabled ? Palette.inactiveGrey :textColor,
                  fontSize: SizeMg.text(18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonConfig {
  final String text;
  final VoidCallback action;
  final bool disabled;

  ButtonConfig(
      {required this.text, required this.action, this.disabled = false});
}
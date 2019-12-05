import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Common.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// ![](https://raw.githubusercontent.com/jaweii/Flutter_beautiful_popup/master/img/bg/thumb.png)
class TemplateThumb extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  TemplateThumb({
    this.options,
  }) : super(options: options);

  @override
  final illustrationPath = 'img/bg/thumb.png';
  @override
  Color get primaryColor => options.primaryColor ?? Color(0xfffb675d);
  @override
  final maxWidth = 400;
  @override
  final maxHeight = 570;
  @override
  final bodyMargin = 0;

  @override
  Widget get title {
    if (options.title is Widget) {
      return SizedBox(
        width: percentW(54),
        height: percentH(10),
        child: options.title,
      );
    }
    return SizedBox(
      width: percentW(100),
      child: Opacity(
        opacity: 0.9,
        child: AutoSizeText(
          options.title,
          maxLines: 1,
          style: TextStyle(
            fontSize: Theme.of(options.context).textTheme.display1.fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  BeautifulPopupButton get button {
    return ({
      @required String label,
      @required void Function() onPressed,
      bool outline = false,
    }) {
      final gradient = LinearGradient(colors: [
        Colors.white.withOpacity(0.25),
        Colors.white.withOpacity(0.05),
      ]);
      final double elevation = outline ? 0 : 2;
      final decoration = BoxDecoration(
        gradient: outline ? null : gradient,
        borderRadius: BorderRadius.all(Radius.circular(80.0)),
        border: Border.all(
          color: outline ? Colors.white.withOpacity(0.95) : Colors.transparent,
          width: outline ? 1 : 0,
        ),
      );
      return RaisedButton(
        color: Colors.transparent,
        elevation: elevation,
        highlightElevation: 0,
        splashColor: Colors.transparent,
        child: Ink(
          decoration: decoration,
          child: Container(
            constraints: BoxConstraints(
              minWidth: 100,
              minHeight: 40.0 - (outline ? 4 : 0),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.95),
              ),
            ),
          ),
        ),
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: onPressed,
      );
    };
  }

  @override
  get layout {
    return [
      Positioned(
        child: background,
      ),
      Positioned(
        top: percentH(10),
        left: percentW(10),
        child: title,
      ),
      Positioned(
        top: percentH(28),
        left: percentW(10),
        height: percentH(actions == null ? 62 : 50),
        width: percentW(78),
        child: content,
      ),
      Positioned(
        bottom: percentW(14),
        left: percentW(10),
        right: percentW(10),
        child: actions ?? Container(),
      ),
    ];
  }
}
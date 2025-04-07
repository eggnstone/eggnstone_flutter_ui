import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget
{
    static const double INNER_HORIZONTAL_PADDING_FOR_WEB = 0;
    static const double INNER_VERTICAL_PADDING_FOR_WEB = 12;
    static const double OUTER_HORIZONTAL_PADDING_FOR_WEB = 0;
    static const double OUTER_VERTICAL_PADDING_FOR_WEB = 6;

    static const double INNER_HORIZONTAL_PADDING_FOR_WINDOWS = 0;
    static const double INNER_VERTICAL_PADDING_FOR_WINDOWS = 8;
    static const double OUTER_HORIZONTAL_PADDING_FOR_WINDOWS = 0;
    static const double OUTER_VERTICAL_PADDING_FOR_WINDOWS = 2;

    final Widget child;

    Button({
        required Widget child,
        Color? color,
        Color? textColor,
        VoidCallback? onPressed,
        super.key
    })
        : child = ElevatedButton(
        child: child,
        style: _createStyle(color, textColor),
        onPressed: onPressed
    );

    // TODO: add textScaleFactor
    Button.text({
        required String text, 
        required VoidCallback? onPressed, 
        Color? color,
        Color? textColor,
        super.key
    })
        : child = ElevatedButton(
        child: _addInnerPadding(Text(text.toUpperCase())),
        style: _createStyle(color, textColor),
        onPressed: onPressed
    );

    Button.icon({
        required Widget icon,
        required String text,
        Color? color,
        VoidCallback? onPressed,
        super.key
    })
        : child = ElevatedButton.icon(
        icon: icon,
        label: _addInnerPadding(Center(child: Text(text.toUpperCase()))),
        style: _createStyle(color, null),
        onPressed: onPressed
    );

    @override
    Widget build(BuildContext context)
    => _addOuterPadding(child);

    static Widget _addInnerPadding(Widget child)
    {
        if (kIsWeb)
            return Padding(
                // ignore: avoid_redundant_argument_values
                padding: const EdgeInsets.symmetric(horizontal: INNER_HORIZONTAL_PADDING_FOR_WEB, vertical: INNER_VERTICAL_PADDING_FOR_WEB),
                child: child
            );

        if (Platform.isWindows)
            return Padding(
                // ignore: avoid_redundant_argument_values
                padding: const EdgeInsets.symmetric(horizontal: INNER_HORIZONTAL_PADDING_FOR_WINDOWS, vertical: INNER_VERTICAL_PADDING_FOR_WINDOWS),
                child: child
            );

        return child;
    }

    static Widget _addOuterPadding(Widget child)
    {
        if (kIsWeb)
            return Padding(
                // ignore: avoid_redundant_argument_values
                padding: const EdgeInsets.symmetric(horizontal: OUTER_HORIZONTAL_PADDING_FOR_WEB, vertical: OUTER_VERTICAL_PADDING_FOR_WEB),
                child: child
            );

        if (Platform.isWindows)
            return Padding(
                // ignore: avoid_redundant_argument_values
                padding: const EdgeInsets.symmetric(horizontal: OUTER_HORIZONTAL_PADDING_FOR_WINDOWS, vertical: OUTER_VERTICAL_PADDING_FOR_WINDOWS),
                child: child
            );

        return child;
    }

    static ButtonStyle _createStyle(Color? color, Color? textColor)
    => ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color),
        foregroundColor: WidgetStateProperty.all(textColor)
    );
}

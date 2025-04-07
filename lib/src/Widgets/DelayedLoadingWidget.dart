import 'dart:async';

import 'package:flutter/material.dart';

class DelayedLoadingWidget extends StatefulWidget
{
    final int delayInMs;
    final String? message;
    final Widget? loadingIndicator;

    const DelayedLoadingWidget({
        required this.delayInMs,
        this.message,
        this.loadingIndicator, 
        super.key
    });

    @override
    State<DelayedLoadingWidget> createState() => _DelayedLoadingWidgetState();
}

class _DelayedLoadingWidgetState extends State<DelayedLoadingWidget>
{
    bool _show = false;

    @override
    void initState()
    {
        super.initState();
        Timer(Duration(milliseconds: widget.delayInMs), ()
            {
                if (mounted)
                    setState(() => _show = true);
            }
        );
    }

    @override
    Widget build(BuildContext context)
    {
        final Widget child = Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    widget.loadingIndicator ?? const CircularProgressIndicator(),
                    if (widget.message != null) const SizedBox(height: 16),
                    if (widget.message != null) Text(widget.message!)
                ]
            )
        );

        if (_show)
            return child;

        return Opacity(opacity: 0, child: child);
    }
}

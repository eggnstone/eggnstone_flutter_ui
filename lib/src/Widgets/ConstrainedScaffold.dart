import 'package:flutter/material.dart';

class ConstrainedScaffold extends StatelessWidget
{
    final AppBar? appBar;
    final Widget body;
    final Widget? floatingActionButton;
    final double? maxWidth;
    final bool? resizeToAvoidBottomInset;

    const ConstrainedScaffold({
        required this.body,
        this.appBar,
        this.floatingActionButton,
        this.maxWidth,
        this.resizeToAvoidBottomInset,
        super.key
    });

    @override
    Widget build(BuildContext context)
    => Scaffold(
        appBar: appBar,
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth ?? 840),
                child: body
            )
        ),
        floatingActionButton: floatingActionButton,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false
    );
}

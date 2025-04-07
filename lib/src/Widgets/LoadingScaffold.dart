import 'package:flutter/material.dart';

import 'ConstrainedScaffold.dart';
import 'DelayedLoadingWidget.dart';
import 'LoadingWidget.dart';

class LoadingScaffold extends StatelessWidget
{
    final String title;
    final String? message;
    final int? delayInMs;
    final Widget? loadingIndicator;

    const LoadingScaffold({
        required this.title, 
        this.message, 
        this.delayInMs,
        this.loadingIndicator, 
        super.key
    });

    @override
    Widget build(BuildContext context)
    => ConstrainedScaffold(
        appBar: AppBar(title: Text(title)),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: delayInMs == null 
                ? LoadingWidget(message: message, loadingIndicator: loadingIndicator)
                : DelayedLoadingWidget(message: message, delayInMs: delayInMs!, loadingIndicator: loadingIndicator)
        )
    );
}

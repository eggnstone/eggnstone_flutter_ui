import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget
{
    final String? message;
    final Widget? loadingIndicator;

    const LoadingWidget({
        this.message,
        this.loadingIndicator, 
        super.key
    });

    @override
    Widget build(BuildContext context)
    => Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                loadingIndicator ?? const CircularProgressIndicator(),
                if (message != null) const SizedBox(height: 16),
                if (message != null) Text(message!)
            ]
        )
    );
}

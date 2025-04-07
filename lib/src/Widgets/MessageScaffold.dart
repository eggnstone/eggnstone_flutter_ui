import 'package:flutter/material.dart';

import 'ConstrainedScaffold.dart';
import 'MessageWidget.dart';

class MessageScaffold extends StatelessWidget
{
    final String title;
    final String message;

    const MessageScaffold({required this.title, required this.message, super.key});

    @override
    Widget build(BuildContext context)
    => ConstrainedScaffold(
        appBar: AppBar(title: Text(title)),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: MessageWidget(message: message)
        )
    );
}

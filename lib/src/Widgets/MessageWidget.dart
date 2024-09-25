// ignore_for_file: diagnostic_describe_all_properties
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget
{
    final Object? error;
    final String? message;
    final TextAlign? textAlign;

    const MessageWidget({this.error, this.message, this.textAlign, super.key})
        :
        assert(error != null || message != null, 'Either error or message must be set.'),
        assert(error == null || message == null, 'Error and message cannot both be set.');

    @override
    Widget build(BuildContext context)
    {
        String? s = message;
        if (s == null)
        {
            final Object? e = error;
            if (e is Exception)
            {
                final Exception e2 = e;
                s = 'EX: ${e2.runtimeType} $e2';
            }
            else
                s = e.toString();
        }

        return Center(child: SingleChildScrollView(child: Text(s, textAlign: textAlign)));
    }
}

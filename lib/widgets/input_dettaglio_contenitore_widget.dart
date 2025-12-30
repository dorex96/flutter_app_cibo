import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget that displays a labeled input field for container details.
///
/// The [label] parameter specifies the text label for the input field.
class InputDettaglioContenitoreWidget extends StatefulWidget {
  const InputDettaglioContenitoreWidget({super.key, required this.label});

  final String label;

  @override
  State<InputDettaglioContenitoreWidget> createState() =>
      _InputDettaglioContenitoreWidgetState();
}

class _InputDettaglioContenitoreWidgetState
    extends State<InputDettaglioContenitoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextField(),
        SizedBox(height: 20.h),
      ],
    );
  }
}

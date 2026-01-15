import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget that displays a labeled input field for container details.
///
/// The [label] parameter specifies the text label for the input field.
/// The [controller] parameter allows access to the text field value.
class InputDettaglioContenitoreWidget extends StatefulWidget {
  const InputDettaglioContenitoreWidget({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;

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
        TextField(
          key: widget.key,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

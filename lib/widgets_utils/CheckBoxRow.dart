import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxRow extends StatelessWidget {
  final bool value;
  final String label;
  final Function(bool?) onChanged;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.deepPurple;
    }
    return Colors.deepPurpleAccent;
  }

  const CheckboxRow({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: value,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }
}

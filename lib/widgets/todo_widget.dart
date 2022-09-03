import 'package:flutter/material.dart';

class ToDoWidget extends StatelessWidget {
  final String? text;
  final bool isDone;
  const ToDoWidget({Key? key, this.text, required this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Theme.of(context).primaryColor.withOpacity(.32);
              }
              return Theme.of(context).primaryColor;
            }),
            value: isDone,
            onChanged: (value) {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Text(
            text ?? '( Unnamed To do )',
            style: TextStyle(
              color: isDone
                  ? Theme.of(context).colorScheme.secondary
                  : Color(0xFF86829D),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

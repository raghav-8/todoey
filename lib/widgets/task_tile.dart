import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

 TaskTile({required this.isChecked, required this.checkboxCallback,required this.taskTitle,required this.longPressCallback});
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle ,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing:  Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: longPressCallback,

    );
  }
}




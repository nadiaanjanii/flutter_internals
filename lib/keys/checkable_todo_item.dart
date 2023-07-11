import 'package:flutter/material.dart';

enum Priority {
  urgent,
  normal,
  low,
}

class CheckableTodoItem extends StatefulWidget {
  const CheckableTodoItem(this.text, this.priority, {Key? key});
  final String text;
  final String priority;

  @override
  State<CheckableTodoItem> createState() => _CheckableTodoItemState();
}

class _CheckableTodoItemState extends State<CheckableTodoItem> {
  var _done = false;

  void _setDone(bool? isChecked) {
    setState(() {
      _done = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;

    if (widget.priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }

    if (widget.priority == Priority.normal) {
      icon = Icons.notifications;
    }

    return ListTile(
      leading: Icon(icon),
      title: Text(widget.text),
      trailing: Checkbox(
        value: _done,
        onChanged: _setDone,
      ),
    );
  }
}

class Todo {
  Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

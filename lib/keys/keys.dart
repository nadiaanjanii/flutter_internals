import 'package:flutter/material.dart';
import './checkable_todo_item.dart';

class Todo {
  Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({Key? key}) : super(key: key);

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  var _order = "asc";
  final _todos = [
    Todo(
      "Learn Flutter",
      Priority.urgent,
    ),
    Todo(
      "Practice Flutter",
      Priority.normal,
    ),
    Todo(
      "Explore other courses",
      Priority.low,
    ),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    sortedTodos.sort(
      (a, b) {
        final bComesAfterA = a.text.compareTo(b.text);
        return _order == 'asc' ? bComesAfterA : -bComesAfterA;
      },
    );
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text("Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}"),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              for (final todo in _orderedTodos)
                CheckableTodoItem(
                  todo.text,
                  todo.priority.toString(),
                )
            ],
          ),
        ),
      ],
    );
  }
}

class TodoItem extends StatelessWidget {
  final String text;
  final Priority priority;

  const TodoItem(this.text, this.priority);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      subtitle: Text(priority.toString()),
    );
  }
}

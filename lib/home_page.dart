import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/todo_event.dart';
import 'package:to_do/todo_state.dart';
import 'todo_bloc.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text('Add Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _taskController,
              decoration:  InputDecoration(labelText: 'Task Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration:  InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:  Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_taskController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
                BlocProvider.of<TodoBloc>(context).add(
                  AddTodoEvent(_taskController.text, _descriptionController.text, false),
                );
                _taskController.clear();
                _descriptionController.clear();
                Navigator.pop(context);
              }
            },
            child:  Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Center(child: Text('To-Do App'))),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return Container(
                margin:  EdgeInsets.all(8.0),
                padding:  EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.title,

                            style: TextStyle(
                              fontSize: 24,
                              decoration: todo.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          Text(
                            todo.description,
                            style:  TextStyle(fontSize: 22,
                              decoration: todo.isCompleted
                              ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          Row(
                            children: [
                               Text('Status: '),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<TodoBloc>(context).add(ToggleTodoEvent(index));
                                },
                                child: Text(
                                  todo.isCompleted ? 'Completed' : 'Incomplete',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: todo.isCompleted ? Colors.green : Colors.red,
                                    decoration: todo.isCompleted
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon:  Icon(Icons.delete),
                      onPressed: () {
                        BlocProvider.of<TodoBloc>(context)
                            .add(DeleteTodoEvent(index));
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child:  Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:to_do_app/database_helper.dart';
import 'package:to_do_app/models/task.dart';

class TaskScreen extends StatefulWidget {
  final Task? task;

  const TaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DataBaseHelper _dbHelper = DataBaseHelper();
  String? _taskTitle;
  String? _taskDescription;
  int _taskId = 0;

  FocusNode? _titleFocusNode;
  FocusNode? _descriptionFocusNode;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _taskId = widget.task!.id!;
      _taskTitle = widget.task!.title;
      _taskDescription = widget.task!.description;
    }

    _descriptionFocusNode = FocusNode();
    _titleFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_taskId != 0) {
            _dbHelper.deleteTask(_taskId);
            Navigator.pop(context);
          } else {}
        },
        backgroundColor: Color(0xFFFE3577),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(Icons.delete_forever),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: _titleFocusNode,
                        onSubmitted: (value) async {
                          if (value != "") {
                            if (_taskId == 0) {
                              Task _newTask = Task(
                                title: value,
                                description: '',
                              );
                              await _dbHelper.insertTask(_newTask);
                            } else {
                              await _dbHelper.updateTaskTitle(_taskId, value);
                            }
                          }
                          _descriptionFocusNode?.requestFocus();
                        },
                        controller: TextEditingController(text: _taskTitle),
                        decoration: InputDecoration(
                          hintText: 'Enter Task Title',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TextField(
                  focusNode: _descriptionFocusNode,
                  onSubmitted: (value) {
                    _dbHelper.updateTaskDescription(_taskId, value);
                    _taskDescription = value;
                  },
                  controller: TextEditingController(text: _taskDescription),
                  decoration: InputDecoration(
                    hintText: 'Enter Description for the Task',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

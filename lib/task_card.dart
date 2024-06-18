import 'package:flutter/material.dart';
import 'task.dart';

class TaskCard extends StatelessWidget {

  final Task task;
  final VoidCallback delete;
  TaskCard({ required this.task, required this.delete });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                task.title,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                task.description,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8.0),
              TextButton.icon(
                onPressed: delete,
                label: Text('delete'),
                icon: Icon(Icons.delete),
              )
            ],
          ),
        )
    );
  }
}
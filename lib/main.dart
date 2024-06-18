import 'package:flutter/material.dart';
import 'task.dart';
import 'task_card.dart';

void main() => runApp(MaterialApp(
    home: TaskList()
));

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(title: 'Learn GraphQL', description: 'Do certification'),
    Task(title: 'Implement effective query systems', description: 'Due in 5 days'),
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void addTask() {
    setState(() {
      tasks.add(Task(
        title: titleController.text,
        description: descriptionController.text,
      ));
      titleController.clear();
      descriptionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('TickTick'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 300.0), // Add padding to avoid content being hidden by the input fields
              child: Column(
                children: tasks.map((task) => TaskCard(
                    task: task,
                    delete: () {
                      setState(() {
                        tasks.remove(task);
                      });
                    }
                )).toList(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.grey[200], // Background color for the input fields
              padding: const EdgeInsets.all(16.0),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Task Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Task Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: addTask,
                      child: Text('Add Todo'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

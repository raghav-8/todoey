import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'add_tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget buildBottomSheet(BuildContext context){

    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: AddTaskScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,TaskData,child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.lightBlueAccent,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.lightBlueAccent,
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: buildBottomSheet,

                );
              },
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 60,
                      bottom: 30,
                      left: 30,
                      right: 30
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.list,
                          size: 30,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        'TODOEY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${TaskData.taskCount} ${TaskData.taskCount  > 1
                            ? 'tasks'
                            : 'task'}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,

                        ),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: TasksList(),


                  ),
                ),

              ],
            ),
          ),

        );
      }
      );

  }
}




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Provider/todos.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/widget/todo_widget.dart';

class TodoListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<TodosProvider>(context);
    final todos=provider.todos;
    return todos.isEmpty? Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 20,color: Colors.red),
            children: [
              TextSpan(
                text: 'Todo',
              ),
              TextSpan(
                text: ' is Empty '
              ),
              WidgetSpan(
                  child: Icon(Icons.content_paste_rounded, size: 23,color: Colors.black)),
            ]
          ),
            ))
        : ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        separatorBuilder: (context,index)=>Container(height: 8),
        itemCount: todos.length,
        itemBuilder: (context,index){
        final todo= todos[index];
        return TodoWidget(todo: todo);
      },
    );
  }
}

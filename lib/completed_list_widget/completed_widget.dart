import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/todos.dart';
import '../widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<TodosProvider>(context);
    final todos=provider.todosCompleted;
    return todos.isEmpty? Center(
        child: RichText(
      text: const TextSpan(
          style: TextStyle(fontSize: 20,color: Colors.red),
          children: [
            TextSpan(
              text: 'No',
            ),
            TextSpan(
                text: ' Completed Task '
            ),
            WidgetSpan(
                child: Icon(Icons.sentiment_dissatisfied_outlined, size: 23,color: Colors.black)),
          ]
      ),))
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

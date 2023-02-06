import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Provider/todos.dart';
import 'package:to_do_app/page/edit_todo_page.dart';
import '../model/todo.dart';
import '../utils snackBar/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  TodoWidget({required this.todo,Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: ()=>editTodo(context,todo),
            caption: 'Edit',
            icon: Icons.edit,
          ),
        ],
        secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              onTap: () =>deleteTodo(context,todo),
              caption: 'Delete',
              icon: Icons.delete,
            )
        ],
        child: buildTodo(context)
    ),
  );

  Widget buildTodo(BuildContext context) =>(
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
                value: todo.isDone,
                activeColor: Colors.red,
                checkColor: Colors.white,
                onChanged: (_){
                  final provider =Provider.of<TodosProvider>(context,listen: false);
                  final isDone=provider.toggleTodoStatus(todo);
                  Utils.showSnackBar(
                    context,
                    isDone ? 'Task Completed' : 'Task Mark Incompleted'
                  );
                }),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 22
                      ),
                    ),
                  ),
                  if(todo.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        todo.description,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      )
    );
  void deleteTodo(BuildContext context,Todo todo){
    final provider=Provider.of<TodosProvider>(context,listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context,'Delete the Task');
  }

  void editTodo(BuildContext context,Todo todo) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context)=> EditTodoPage(todo: todo))
  );
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Provider/todos.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  EditTodoPage({Key? key,required this.todo}): super (key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description=widget.todo.description;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
                onPressed: (){
                  final provider=Provider.of<TodosProvider>(context,listen: false);
                  provider.removeTodo(widget.todo);
                  Navigator.of(context).pop();
                }

              )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: TodoFormWidget(
            title: title,
            description: description,
            onChangedTitle:(title)=> setState(()=> this.title= title),
            onChangedDescription:(description)=> setState(()=> this.description=description),
            onSavedTodo: saveTodo,
          ),
        ),
      ),
    );
  }
  void saveTodo(){
    final isValid= _formKey.currentState!.validate();
    if(!isValid){
      return;
    }
    else{
      final provider=Provider.of<TodosProvider>(context,listen: false);
      provider.updateTodo(widget.todo,title,description);
      Navigator.of(context).pop();
    }

  }
}

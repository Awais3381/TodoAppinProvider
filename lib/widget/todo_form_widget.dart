import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;


  const TodoFormWidget({Key? key,this.title='',this.description='',required this.onChangedTitle,required this.onChangedDescription,required this.onSavedTodo}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          buildDescription(),
          SizedBox(
            height: 30,
          ),
          buildButton(),
        ],
      ),
    );
  }
  //Build Title
  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    validator: (title){
      if(title!.isEmpty){
        return 'The Title Cannot be Empty';
      }
      return null;
    },
      onChanged: onChangedTitle,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title'
    )
  );

  //Build Description
  Widget buildDescription() => TextFormField(
    maxLines: 3,
    maxLength: 100,
    initialValue: description,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description'
    ),
  );

  //Build Button
  Widget buildButton()  => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red)
        ),
        onPressed: onSavedTodo,
        child: Text('Save')),
  );
}








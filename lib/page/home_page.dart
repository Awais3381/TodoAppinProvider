import 'package:flutter/material.dart';
import 'package:to_do_app/widget/add_todo_dialogwidget.dart';

import '../completed_list_widget/completed_widget.dart';
import '../widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final tabs=[
      TodoListWidget(),
      CompletedListWidget()
    ];
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('Todo App  ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            Image.asset('assets/trr.PNG',width: 40,height: 70,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex =index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              label: 'Todos'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28,),
              label: 'Completed'
          )
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        backgroundColor: Colors.red,
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AddToDoDialogWidget(),
            barrierDismissible: false
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/todo.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
  final Todo task;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! == true ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //if (a==5) {.....} => a==5? DOGRU:YANLIS --> ternary operation
            /* 
             TODO:FİREBASE İŞLEMLERİNDE DÜZELT
            widget.task.type == Tasktype.note
                ? Image.asset("lib/assets/images/category_1.png")
                : widget.task.type == Tasktype.contest
                    ? Image.asset("lib/assets/images/category_3.png")
                    : Image.asset("lib/assets/images/category_2.png"),
              */
            Image.asset("lib/assets/images/category_1.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.todo!,
                    style: TextStyle(
                        decoration: widget.task.completed!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                  Text(
                    "User:${widget.task.userId!}",
                    style: TextStyle(
                        decoration: widget.task.completed!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  () {
                    widget.task.completed = !widget.task.completed!;
                    isChecked =
                        val!; //eğer sadece val değişkeni varsa işleme koy demek !
                  },
                )
              },
            ),
          ],
        ),
      ),
    );
  }
}

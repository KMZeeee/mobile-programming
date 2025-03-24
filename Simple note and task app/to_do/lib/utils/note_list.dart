import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NoteList extends StatelessWidget {
  const NoteList({
    super.key,
    required this.title,
    required this.content,
    required this.deleteFunction,
    required this.editFunction,
  });

  final String title;
  final String content;
  final Function(BuildContext)? deleteFunction;
  final Function(BuildContext)? editFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
        bottom: 0.0,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.edit,
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Color(0xFFFFD369),
              foregroundColor: Color(0xFF222831),
              autoClose: true,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Color(0xFFBE3144),
              foregroundColor: Color(0xFFEEEEEE),
              autoClose: true,
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Color(0xFF222831),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 18),
              ),
              SizedBox(height: 15),
              Text(
                content,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

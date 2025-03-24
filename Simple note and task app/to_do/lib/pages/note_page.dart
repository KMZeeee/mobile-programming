import 'package:flutter/material.dart';
import 'package:to_do/utils/note_list.dart';
import 'add_note_page.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List notes = [
    [
      'Loren Ipsum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sed consequat magna. Nulla tristique sodales laoreet. Nunc vel est nec arcu molestie tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. In hac habitasse platea dictumst. Etiam in convallis risus.',
    ],
    [
      'Loren Ipsum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sed consequat magna. Nulla tristique sodales laoreet. Nunc vel est nec arcu molestie tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. In hac habitasse platea dictumst. Etiam in convallis risus.',
    ],
  ];

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void addNewNote() async {
    final newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNotePage()),
    );

    if (newNote != null) {
      setState(() {
        notes.add(newNote);
      });
    }
  }

  void editNote(int index) async {
    final editedNote = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddNotePage(
              existingTitle: notes[index][0], // Pass existing title
              existingContent: notes[index][1], // Pass existing content
            ),
      ),
    );

    if (editedNote != null) {
      setState(() {
        notes[index] = editedNote; // Update note
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF393E46),
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true,
        backgroundColor: Color(0xFF222831),
        foregroundColor: Color(0xFFEEEEEE),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteList(
            title: notes[index][0],
            content: notes[index][1],
            deleteFunction: (context) => deleteNote(index),
            editFunction: (context) => editNote(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewNote,
        backgroundColor: Color(0xFFFFD369),
        foregroundColor: Color(0xFF222831),
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key, this.existingTitle, this.existingContent});

  final String? existingTitle;
  final String? existingContent;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.existingTitle ?? '');
    _contentController = TextEditingController(
      text: widget.existingContent ?? '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void saveNewNote() {
    setState(() {
      if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
        return;
      }
      List newNote = [_titleController.text, _contentController.text];
      Navigator.pop(context, newNote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF393E46),
      appBar: AppBar(
        title: const Text('Add or Edit Note'),
        centerTitle: true,
        backgroundColor: Color(0xFF222831),
        foregroundColor: Color(0xFFEEEEEE),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Add title',
                      fillColor: Color(0xFFEEEEEE),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF222831)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF222831)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _contentController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Add content',
                      fillColor: Color(0xFFEEEEEE),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF222831)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF222831)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    maxLines: 10,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: saveNewNote,
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFD369),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    'Save Note',
                    style: TextStyle(fontSize: 15, color: Color(0xFF222831)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

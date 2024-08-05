import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app1/models/note_model.dart';


class MyNotesHeaderSection extends StatelessWidget {
  const MyNotesHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          'images/note.png',
          width: 100,
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          "My notes",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
  )
        ),
        const SizedBox(
          height: 8,
        ),
        const NotesCounterWidget(),
      ],
    );
  }
}

class NotesCounterWidget extends StatelessWidget {
  const NotesCounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<NoteModel>('notes').listenable(),
        builder: (context, Box<NoteModel> box, _) {
          return Text(
            "${Hive.box<NoteModel>('notes').length} notes",
            style:TextStyle(
                     fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff939191),
                    fontFamily: 'Montserrat',),
          );
        });
  }
}
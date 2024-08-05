import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iconly/iconly.dart';
import 'package:note_app1/models/note_model.dart';
import 'package:note_app1/utils/text_feild_style.dart';
import 'package:note_app1/widgets/custom_no_note.dart';
import 'package:note_app1/widgets/items.dart';
import 'package:hive/hive.dart';

class NoteBodySection extends StatefulWidget {
  const NoteBodySection({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<NoteBodySection> createState() => _NoteBodySectionState();
}

class _NoteBodySectionState extends State<NoteBodySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          minLines: 1,
          maxLines: 5,
          maxLength: 250,
          onChanged: (value) {
            widget.controller.text = value;
          },
          decoration: InputDecoration(
            hintText: "Enter Your Note",
            suffixIcon: IconButton(
              onPressed: () {
                addingToDatabase(widget.controller);
              },
              icon: const Padding(
                padding: EdgeInsets.only(right: 12.0, left: 4),
                child: Icon(
                  IconlyLight.edit,
                ),
              ),
            ),
            border: borderStyle(),
            focusedBorder: borderStyle(),
            enabledBorder: borderStyle(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Hive.box<NoteModel>('notes').length == 0
            ? const CustomNoNotesWidget()
            : Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<NoteModel>('notes').listenable(),
                  builder: (context, Box<NoteModel> box, _) {
                    return ListView.builder(
                      itemCount: Hive.box<NoteModel>('notes').length,
                      itemBuilder: (context, index) {
                        var note = Hive.box<NoteModel>('notes').getAt(
                            Hive.box<NoteModel>('notes').length - index - 1)!;
                        return NoteItem(
                          onDismissed: () {
                            box.deleteAt(Hive.box<NoteModel>('notes').length -
                                index -
                                1);
                            setState(() {});
                          },
                          note: note,
                        );
                      },
                    );
                  },
                ),
              ),
      ],
    );
  }

  void addingToDatabase(TextEditingController controller) {
    String cleanedText = controller.text.replaceAll('\n', ' ').trim();

    if (cleanedText.isNotEmpty) {
      Hive.box<NoteModel>('notes').add(NoteModel(
        content: cleanedText,
        date: DateTime.now(),
      ));
      setState(() {});
      controller.clear();
    }
  }
}
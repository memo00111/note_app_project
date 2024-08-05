import 'package:flutter/material.dart';
import 'package:note_app1/models/note_model.dart';
import 'package:note_app1/widgets/background.dart';
import 'package:note_app1/widgets/card.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
    required this.onDismissed,
  });
  final Function onDismissed;
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm Deletion"),
              content: const Text("Are you sure you want to delete this note?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text("Delete"),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        onDismissed();
      },
      background: const DismissibleBackgroundContainer(
        right: false,
      ),
      secondaryBackground: const DismissibleBackgroundContainer(),
      direction: DismissDirection.endToStart,
      dismissThresholds: const {
        DismissDirection.endToStart: 0.3,
      },
      child: NoteCard(note: note),
    );
  }
}
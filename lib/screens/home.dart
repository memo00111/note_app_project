import 'package:flutter/material.dart';
import 'package:note_app1/widgets/note_body.dart';
import 'package:note_app1/widgets/notes_header_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(child: 
      Padding(padding: const EdgeInsets.symmetric(
        vertical: 14.0,
          horizontal:32.0,
      ),
         child:SizedBox(
        width: double.infinity,
        child: Column(
              children: [
                const MyNotesHeaderSection(),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: NoteBodySection(
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
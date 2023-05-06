import 'package:flutter/material.dart';

import '../../../models/quick_note.dart';
import 'quick_notes_page_item.dart';

class QuickNotesSection extends StatelessWidget {
  const QuickNotesSection({
    super.key,
    required this.notes,
  });

  final List<QuickNote> notes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: notes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 4 / 5,
      ),
      itemBuilder: (context, index) {
        return QuickNotePageItem(
          item: notes[index],
          index: index,
        );
      },
    );
  }
}
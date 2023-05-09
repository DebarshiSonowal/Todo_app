import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../models/essential_note.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import 'notes_list_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.essentials,
  });

  final List<EssentialNotes> essentials;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: essentials.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 4/(4.5),
      ),
      itemBuilder: (BuildContext context, int index) {
        var item = essentials[index];
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            NotesListItem(
              item: item,
              index: index,
            ),
            IconButton(
              onPressed: () {
                Provider.of<Repository>(context, listen: false)
                    .removeEssential(item);
                if (essentials.isEmpty) {
                  Navigation.instance.goBack();
                }
              },
              icon: SvgPicture.asset(
                Constances.trashIcon,
                fit: BoxFit.fill,
                color: const Color(0xff50555C),
                height: 15.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}

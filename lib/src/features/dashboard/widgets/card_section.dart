import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../models/essential_note.dart';
import '../../../models/quick_note.dart';
import '../../../services/Navigate.dart';
import 'essential_demo_list.dart';
import 'notes_card.dart';

class CardSection extends StatelessWidget {
  const CardSection({
    super.key,
    required this.essentials,
    required this.quickNotes,
  });

  final List<EssentialNotes> essentials;
  final List<QuickNote> quickNotes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21.5.h,
      child: Row(
        children: [
          notesCard(
            image: Constances.notesImage,
            list: essentials.isEmpty ? [] : [],
            widget: essentials.isEmpty
                ? Container()
                : EssentialDemoList(
              essential: essentials[0],
            ),
            onTap: () {
              if (essentials.isEmpty) {
                Navigation.instance.navigate(Routes.addEssentialPage);
              } else {
                Navigation.instance.navigate(Routes.essentialsList);
              }
            },
            name: "Essentials",
            onArrowClick: () {
              Navigation.instance.navigate(Routes.addEssentialPage);
            },
          ),
          notesCard(
            image: Constances.handImage,
            list: quickNotes.isEmpty ? [] : [],
            onTap: () {
              Navigation.instance.navigate(Routes.quickNotesList);
            },
            name: "Quick",
            onArrowClick: () {
              Navigation.instance.navigate(Routes.addQuickPage);
            },
            widget: Text(
              "${quickNotes.isEmpty ? "" : quickNotes.first.description}",
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Colors.white,
                fontSize: 11.sp,
                fontFamily: "PublicSans",
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
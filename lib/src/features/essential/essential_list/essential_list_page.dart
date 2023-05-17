import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/routes.dart';
import '../../../models/essential_note.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../../../widget/add_button.dart';
import 'widgets/essential_list_appbar.dart';
import 'widgets/notes_list.dart';

class EssentialListPage extends StatelessWidget {
  const EssentialListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: const EssentialListAppBar(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        child: Consumer<Repository>(builder: (context, data, _) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              NotesList(
                essentials: data.essentials,
              ),
              AddButton(
                onTap: () {
                  Navigation.instance.navigate(Routes.addEssentialPage);
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}



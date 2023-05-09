import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../constants/routes.dart';
import '../../models/essential_note.dart';
import '../../repository/repository.dart';
import '../../services/Navigate.dart';
import '../../widget/alert.dart';
import '../add_essential/Widgets/add_essential_page_empty_item.dart';
import '../add_essential/Widgets/add_essential_page_item.dart';
import '../add_essential/Widgets/essential_appbar.dart';

class EditEssentialPage extends StatefulWidget {
  const EditEssentialPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<EditEssentialPage> createState() => _EditEssentialPageState();
}

class _EditEssentialPageState extends State<EditEssentialPage> {
  EssentialNotes? essentialNotes;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          milliseconds: 10,
        ), () {
      setState(() {
        essentialNotes = Provider.of<Repository>(context, listen: false)
            .essentials[widget.index];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: EssentialAppbar(
          onTap: () {
            Provider.of<Repository>(context, listen: false)
                .updateEssentials(essentialNotes!, widget.index);
            Navigation.instance.navigateAndReplace(Routes.essentialsList);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        height: double.infinity,
        width: double.infinity,
        color: Constances.blueBackground,
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.h,
                ),
                height: 46.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (index != essentialNotes!.notes.length) {
                      return AddEssentialPageItem(
                        index: index,
                        item: essentialNotes!.notes[index],
                        update: (String val) {
                          setState(() {
                            essentialNotes!.notes[index].title = val;
                            essentialNotes!.notes[index].isCompleted = false;
                          });
                        },
                      );
                    } else {
                      return AddEssentialPageEmptyItem(
                        index: index,
                        update: (String val) {
                          setState(() {
                            essentialNotes!.notes.add(EssentialNote(
                              val,
                              false,
                            ));
                            essentialNotes!.date = DateFormat("dd MMM yyyy")
                                .format(DateTime.now());
                          });
                        },
                      );
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 1.h,
                    );
                  },
                  itemCount: essentialNotes!.notes.length + 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showError(String msg) {
    AlertX.instance.showAlert(
        title: "Error",
        msg: msg,
        positiveButtonText: "Done",
        positiveButtonPressed: () {
          Navigation.instance.goBack();
        });
  }
}

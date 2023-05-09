import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';

import '../../constants/constants.dart';
import '../../models/essential_note.dart';
import '../../repository/repository.dart';
import '../../services/Navigate.dart';
import '../../widget/alert.dart';
import '../../widget/done_button.dart';
import 'Widgets/add_essential_page_empty_item.dart';
import 'Widgets/add_essential_page_item.dart';
import 'Widgets/essential_appbar.dart';
import 'Widgets/essential_page_instructions.dart';

class AddEssentialPage extends StatefulWidget {
  const AddEssentialPage({Key? key}) : super(key: key);

  @override
  State<AddEssentialPage> createState() => _AddEssentialPageState();
}

class _AddEssentialPageState extends State<AddEssentialPage> {
  EssentialNotes item = EssentialNotes([], "");

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      showMyDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: EssentialAppbar(
          onTap: () {
            if (item.notes.isNotEmpty) {
              Provider.of<Repository>(context, listen: false)
                  .addEssential(item!);
              Navigation.instance.navigateAndReplace(Routes.essentialsList);
            } else {
              showError("Cannot add empty list");
            }
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
                    if (index != item.notes.length) {
                      return AddEssentialPageItem(
                        index: index,
                        item: item.notes[index],
                        update: (String val) {
                          setState(() {
                            item.notes[index].title = val;
                            item.notes[index].isCompleted = false;
                          });
                        },
                      );
                    } else {
                      return AddEssentialPageEmptyItem(
                        index: index,
                        update: (String val) {
                          setState(() {
                            item.notes.add(EssentialNote(
                              val,
                              false,
                            ));
                            item.date = DateFormat("dd MMM yyyy")
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
                  itemCount: item.notes.length + 1,
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

  void showMyDialog(BuildContext context) {
    // showDialog(
    //     barrierDismissible: true,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return const BookmarkPageInstructions();
    //     });
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      // barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 1),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return const EssentialPageInstructions();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}

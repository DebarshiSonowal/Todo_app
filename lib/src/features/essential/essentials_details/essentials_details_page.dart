import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/essential_note.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../add_essential/Widgets/add_essential_page_empty_item.dart';
import '../add_essential/Widgets/add_essential_page_item.dart';
import '../add_essential/Widgets/essential_appbar.dart';
import 'widgets/essentials_details_appbar.dart';

class EssentialDetailsPage extends StatefulWidget {
  const EssentialDetailsPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<EssentialDetailsPage> createState() => _EssentialDetailsPageState();
}

class _EssentialDetailsPageState extends State<EssentialDetailsPage> {
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
        child: EssentialDetailsAppbar(
            index: widget.index,
            item: Provider.of<Repository>(context, listen: false)
                .essentials[widget.index]),
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
            Stack(
              alignment: Alignment.topRight,
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
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Constances.essentialEditBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          Provider.of<Repository>(context, listen: false)
                                  .essentials[widget.index]
                                  .date ??
                              "",
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.black87,
                                    fontFamily: "Roboto",
                                  ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          "Please mark the achieve",
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.black87,
                                    fontFamily: "Roboto",
                                  ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (index != essentialNotes!.notes.length) {
                              return DetailsEssentialPageItem(
                                index: index,
                                item: essentialNotes!.notes[index],
                                update: (String val) {
                                  setState(() {
                                    essentialNotes!.notes[index].title = val;
                                    essentialNotes!.notes[index].isCompleted =
                                        false;
                                  });
                                },
                                updateCheckBox: (bool val) {
                                  setState(() {
                                    Provider.of<Repository>(context,
                                            listen: false)
                                        .updateEssentialCompleted(
                                            val, widget.index, index);
                                  });
                                },
                              );
                            } else {
                              return Container();
                              // return AddEssentialPageEmptyItem(
                              //   index: index,
                              //   update: (String val) {
                              //     setState(() {
                              //       essentialNotes!.notes.add(EssentialNote(
                              //         val,
                              //         false,
                              //       ));
                              //       essentialNotes!.date =
                              //           DateFormat("dd MMM yyyy")
                              //               .format(DateTime.now());
                              //     });
                              //   },
                              // );
                            }
                          },
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.5.h,
                              ),
                              child: Divider(
                                thickness: 0.05.h,
                                color: Colors.black54,
                              ),
                            );
                          },
                          itemCount: essentialNotes!.notes.length,
                        ),
                        Divider(
                          thickness: 0.05.h,
                          color: Colors.black54,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigation.instance
                        .navigate(Routes.essentialsEdit, args: widget.index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 4.w,
                      top: 1.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 14.sp,
                        ),
                        SizedBox(
                          width: 0.5.w,
                        ),
                        Text(
                          "Edit",
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    fontFamily: "Roboto",
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

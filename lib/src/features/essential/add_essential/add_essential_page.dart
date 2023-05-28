import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/constants/routes.dart';

import '../../../constants/constants.dart';
import '../../../models/essential_note.dart';
import '../../../repository/repository.dart';
import '../../../services/Navigate.dart';
import '../../../widget/alert.dart';
import '../../../widget/done_button.dart';
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
  // List<String> bulletPoints = [];
  late FocusNode _focusNode;
  int? _editingIndex;
  List<FocusNode> _focusNodes = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 400), () {
      showMyDialog(context);
    });
    _focusNode = FocusNode();
    _editingIndex = null;
    // bulletPoints.add(''); // Add an empty bullet point initially

    // _focusNodes = List<FocusNode>.generate(bulletPoints.length + 1, (index) => FocusNode());

    _editingIndex = null;
    // _keyboardFocus = ValueNotifier<bool>(false);
    // _keyboardFocus = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    // _keyboardFocus.dispose();
    super.dispose();
  }

  void _addBulletPoint(String text) {
    setState(() {
      // bulletPoints.add(text);
                  item.notes.add(EssentialNote(
                    text,
                    false,
                  ));
                  item.date = DateFormat("dd MMM yyyy")
                      .format(DateTime.now());
      // _editingIndex = bulletPoints.length - 1;
      _editingIndex = item.notes.length - 1;
    });

    // Delay the focus request using Timer
    // Future.delayed(const Duration(seconds: 0), () {
    //   FocusScope.of(context).requestFocus(_focusNode);
    // });
    //
    // // Clear the text field for the new bullet point
    // _focusNode.requestFocus();
    // _focusNode.requestFocus(FocusNode());
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        _editingIndex = null;
      });
      _focusNode.requestFocus();
    });
  }

  void _editBulletPoint(int index) {
    setState(() {
      _editingIndex = index;
    });

    _focusNodes[index].requestFocus();
  }
  BuildContext? _getItemBuildContext(int index) {
    final key = GlobalKey();
    return key.currentContext;
  }
  void _saveBulletPoint(int index, String text) {
    setState(() {
      if (text.isNotEmpty) {
        // bulletPoints[index] = text;
        item.notes[index].title = text;
      } else {
        item.notes.removeAt(index);
        if (_editingIndex == index) {
          _editingIndex = null;
        } else if (_editingIndex != null && _editingIndex! > index) {
          _editingIndex = _editingIndex! - 1;
        }
      }
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
                  child: ListView.builder(

                    itemCount: item.notes.length + 1,
                    itemBuilder: (context, index) {
                      // final focusNode = _focusNodes[index];
                      if (index == item.notes.length) {
                        return ListTile(
                          title: Row(
                            children: [
                              Text(
                                "${index + 1}. ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                    ),
                              ),
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  maxLines: 1,
                                  focusNode: _focusNode,
                                  onSubmitted: (text) {
                                    // _saveBulletPoint(index, text);
                                    if (text.isNotEmpty) {
                                      _addBulletPoint(text);
                                    }
                                    // _focusNode.requestFocus();
                                  },
                                  minLines: 1,
                                  // initialValue: "${item.title}",
                                  decoration: InputDecoration.collapsed(
                                    hintText:
                                        index == 0 ? 'Necessary Item' : '',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        ?.copyWith(
                                          fontSize: 12.sp,
                                          color: Colors.black54,
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: "Roboto",
                                        ),
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontFamily: "Roboto",
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return ListTile(
                          // leading: Text('\u2022'),
                          title: _editingIndex == index
                              ? Row(
                                  children: [
                                    Text(
                                      "${index + 1}. ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontFamily: "Roboto",
                                          ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: TextField(
                                        maxLines: 1,
                                        focusNode: _focusNode,
                                        autofocus: true,
                                        controller: TextEditingController(
                                            text: item.notes[index].title),
                                        onSubmitted: (text) {
                                          _saveBulletPoint(index, text);
                                        },
                                        minLines: 1,
                                        // initialValue: "${item.title}",
                                        decoration: InputDecoration.collapsed(
                                          hintText: index == 0
                                              ? 'Necessary Item'
                                              : '',
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              ?.copyWith(
                                                fontSize: 12.sp,
                                                color: Colors.black54,
                                                // fontWeight: FontWeight.bold,
                                                fontFamily: "Roboto",
                                              ),
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontFamily: "Roboto",
                                            ),
                                      ),
                                    ),
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    _editBulletPoint(index);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "${index + 1}. ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontFamily: "Roboto",
                                            ),
                                      ),
                                      Text(
                                        item.notes[index].title??"",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontFamily: "Roboto",
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                        );
                      }
                    },
                  )

                  // child: ListView.separated(
                  //   itemBuilder: (context, index) {
                  //     if (index != item.notes.length) {
                  //       return AddEssentialPageItem(
                  //         index: index,
                  //         item: item.notes[index],
                  //         update: (String val) {
                  //           setState(() {
                  //             item.notes[index].title = val;
                  //             item.notes[index].isCompleted = false;
                  //           });
                  //         },
                  //       );
                  //     } else {
                  //       return AddEssentialPageEmptyItem(
                  //         index: index,
                  //         update: (String val) {
                  //           setState(() {
                  //             item.notes.add(EssentialNote(
                  //               val,
                  //               false,
                  //             ));
                  //             item.date = DateFormat("dd MMM yyyy")
                  //                 .format(DateTime.now());
                  //           });
                  //         },
                  //       );
                  //     }
                  //   },
                  //   separatorBuilder: (context, index) {
                  //     return SizedBox(
                  //       height: 1.h,
                  //     );
                  //   },
                  //   itemCount: item.notes.length + 1,
                  // ),
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

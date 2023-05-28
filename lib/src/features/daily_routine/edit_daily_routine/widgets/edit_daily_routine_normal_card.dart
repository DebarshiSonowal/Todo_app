import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/models/daily_routine_model.dart';
import 'package:vishal_todo_app/src/widget/custom_text_editing_controller.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/routes.dart';
import '../../../../models/reminder_list_item.dart';
import '../../../../repository/repository.dart';
import '../../../../services/Navigate.dart';
import '../../../../widget/alert.dart';
import '../../../../widget/bullet_formater.dart';
import '../../../../widget/bullet_note_item_list_empty.dart';
import '../../../../widget/bullet_note_item_list_not_empty.dart';
import '../../../../widget/image_popup_body.dart';
import '../../../../widget/routine_item_widget.dart';

class EditDailyRoutineNormalCard extends StatefulWidget {
  EditDailyRoutineNormalCard(
      {Key? key,
      required this.index,
      required this.titleController,
      required this.reminders,
      required this.updateImage,
      required this.attachment,
      required this.textController})
      : super(key: key);
  final int index;
  final TextEditingController titleController;
  final CustomTextEditingController textController;
  final List<ReminderListItem> reminders;
  final Function(File) updateImage;
  final File? attachment;

  @override
  State<EditDailyRoutineNormalCard> createState() =>
      _EditDailyRoutineNormalCardState();
}

class _EditDailyRoutineNormalCardState
    extends State<EditDailyRoutineNormalCard> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final ImagePicker picker = ImagePicker();
  late FocusNode _focusNode;
  List<int> _lineIndices = [];
  int? _previousFocusLineIndex;

  @override
  void initState() {
    super.initState();
    // _controller = TextEditingController();
    _focusNode = FocusNode();
    widget.titleController.text =
        Provider.of<Repository>(context, listen: false)
                .models[widget.index]
                .title ??
            "";
    widget.textController.text = Provider.of<Repository>(context, listen: false)
            .models[widget.index]
            .text ??
        "";
    widget.textController.addListener(_handleTextChange1);
  }

  @override
  void dispose() {
    // _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      // var current = data.models[index];
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 2.h,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Constances.blueBackground,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  //  showPhotoBottomSheet(getSelectedImage);
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 0.5.h,
                    ),
                    decoration: const BoxDecoration(
                      color: Constances.textFieldBackground,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    width: double.infinity,
                    child: TextFormField(
                      // initialValue: current.title,
                      controller: widget.titleController,
                      maxLines: 2,
                      minLines: 1,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Title',
                        hintStyle:
                            Theme.of(context).textTheme.headline4?.copyWith(
                                  fontSize: 12.sp,
                                  color: Colors.white70,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                ),
                      ),
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 30.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 2.h,
                    ),
                    decoration: const BoxDecoration(
                      color: Constances.textFieldBackground,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    width: double.infinity,
                    child: TextFormField(
                      autofocus: false,
                      // focusNode: widget.focusNode??null,
                      // maxLines: 1,
                      controller: widget.textController,
                      focusNode: _focusNode,
                      onChanged: _handleTextChange,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                      inputFormatters: [
                        // BulletFormatter(),
                      ],
                      // onEditingComplete: () {
                      //   // debugPrint("onEditingComplete1");
                      //   if (textEditingController.text.isEmpty) {
                      //     widget.remove();
                      //   }
                      // },
                      // onFieldSubmitted: (val) {
                      //   if (val.isNotEmpty) {
                      //     setState(() {
                      //       txt = val;
                      //     });
                      //     widget.updateList(
                      //         val,
                      //         timePicked == null
                      //             ? widget.item.timeDate!
                      //             : timePicked!.toDateTime());
                      //   } else {
                      //     widget.remove();
                      //   }
                      // },
                      // minLines: 1,
                      // initialValue: "${widget.item.title}",
                      cursorColor: Colors.white,
                      decoration: InputDecoration.collapsed(
                        hintText: '',
                        hintStyle:
                            Theme.of(context).textTheme.headline4?.copyWith(
                                  fontSize: 12.sp,
                                  color: Colors.white60,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                ),
                      ),
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontFamily: "Roboto",
                          ),
                    ),
                    // child: current.reminders.isNotEmpty
                    //     ? BulletNoteItemListNotEmpty(
                    //         current: current,
                    //         index: index,
                    //         type: 0,
                    //       )
                    //     : BulletNoteItemListEmpty(
                    //         reminders: reminders,
                    //         count: index,
                    //         type: 0,
                    //       ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showPhotoBottomSheet(getSelectedImage);
                    },
                    child: data.models[widget.index].image == null
                        ? (widget.attachment == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SvgPicture.asset(
                                  Constances.addImageIcon,
                                  color: Colors.white38,
                                  fit: BoxFit.cover,
                                  height: 50.sp,
                                  width: 50.sp,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30.sp, // Image radius
                                backgroundImage: Image.file(
                                        File(widget.attachment?.path ?? ""))
                                    .image,
                              ))
                        : (data.models[widget.index].type == 1
                            ? CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30.sp, // Image radius
                                backgroundImage: (Image.file(
                                  File(data.models[widget.index].image!),
                                  errorBuilder: (error, str, _) {
                                    return Image.asset(
                                      data.models[widget.index].image!,
                                    );
                                  },
                                )).image,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: const Color(0xff50555C))),
                                child: Image.asset(
                                  data.models[widget.index].image!,
                                  errorBuilder: (error, str, _) {
                                    return Image.asset(
                                      data.models[widget.index].image!,
                                    );
                                  },
                                ),
                              )),
                  )
                ],
              ),
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     data.models.removeAt(index);
          //     Fluttertoast.showToast(msg: "Deleted Successfully");
          //     Navigation.instance.navigateAndReplace(Routes.dashboard);
          //   },
          //   icon: SvgPicture.asset(
          //     Constances.trashIcon,
          //     fit: BoxFit.fill,
          //     height: 15.sp,
          //   ),
          // ),
        ],
      );
    });
  }

  void _handleTextChange(String s) {
    final newText =  widget.textController.text;
    final lines = newText.split('\n');
    final formattedLines = lines.asMap().entries.map((entry) {
      final index = entry.key + 1;
      final line = entry.value;
      final trimmedLine = line.trim();
      if (trimmedLine.isNotEmpty && trimmedLine.startsWith('$index.')) {
        _lineIndices.add(index);
        return line;
      }
      final bulletPoint = '$index. ';
      _lineIndices.add(index);
      return bulletPoint + line;
    }).join('\n');

    final cursorPosition =  widget.textController.selection;
    final cursorOffset = cursorPosition.extentOffset;
    final newCursorPosition = TextSelection.fromPosition(TextPosition(offset: cursorOffset));

    final currentLineIndex = _getCurrentLineIndex(cursorOffset);
    if (_previousFocusLineIndex != null && currentLineIndex == _previousFocusLineIndex) {
      // Update text with formatted lines and maintain cursor position
       widget.textController.updateText(formattedLines);
      _updateCursorPosition(newCursorPosition);
    } else {
      // Update text with formatted lines and move cursor to previous focused line
       widget.textController.updateText(formattedLines);
      if (_previousFocusLineIndex != null) {
        _moveCursorToLine(_previousFocusLineIndex!);
      }
      _previousFocusLineIndex = currentLineIndex; // Update previous focus line index
    }
  }
  void _handleTextChange1() {
    final newText =  widget.textController.text;
    final lines = newText.split('\n');
    final formattedLines = lines.asMap().entries.map((entry) {
      final index = entry.key + 1;
      final line = entry.value;
      final trimmedLine = line.trim();
      if (trimmedLine.isNotEmpty && trimmedLine.startsWith('$index.')) {
        _lineIndices.add(index);
        return line;
      }
      final bulletPoint = '$index. ';
      _lineIndices.add(index);
      return bulletPoint + line;
    }).join('\n');

    final cursorPosition =  widget.textController.selection;
    final cursorOffset = cursorPosition.extentOffset;
    final newCursorPosition = TextSelection.fromPosition(TextPosition(offset: cursorOffset));

    final currentLineIndex = _getCurrentLineIndex(cursorOffset);
    if (_previousFocusLineIndex != null && currentLineIndex == _previousFocusLineIndex) {
      // Update text with formatted lines and maintain cursor position
       widget.textController.updateText(formattedLines);
      _updateCursorPosition(newCursorPosition);
    } else {
      // Update text with formatted lines and move cursor to previous focused line
       widget.textController.updateText(formattedLines);
      if (_previousFocusLineIndex != null) {
        _moveCursorToLine(_previousFocusLineIndex!);
      }
      _previousFocusLineIndex = currentLineIndex; // Update previous focus line index
    }
  }

  int _getCurrentLineIndex(int cursorOffset) {
    final text =  widget.textController.text;
    final textBeforeCursor = text.substring(0, cursorOffset);
    final lines = textBeforeCursor.split('\n');
    final currentLineIndex = lines.length;
    return currentLineIndex;
  }

  void _moveCursorToLine(int lineIndex) {
    final text =  widget.textController.text;
    final lines = text.split('\n');
    if (lineIndex >= 0 && lineIndex < lines.length) {
      final lineStart = lines.sublist(0, lineIndex).join('\n').length + lineIndex;
      final lineEnd = lineStart + lines[lineIndex].length;

      final newCursorPosition = TextSelection.collapsed(offset: lineEnd);
      _updateCursorPosition(newCursorPosition);
    }
  }

  void _updateCursorPosition(TextSelection newCursorPosition) {
    Future.delayed(Duration.zero, () {
      if (mounted) {
         widget.textController.selection = newCursorPosition;
      }
    });
  }
  void showPhotoBottomSheet(Function(int) getImage) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    BuildContext? context = Navigation.instance.navigatorKey.currentContext;
    if (context != null) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return ImagePopUpBody(
              getImage: getImage,
            );
          });
    }
  }

  Future<void> getSelectedImage(int index) async {
    if (index == 0) {
      var status = await Permission.camera.request();
      if (status.isDenied) {
        showError("Permission Denied");
      } else {
        final pickedFile = await ImagesPicker.openCamera(
          pickType: PickType.image,
          quality: 0.7,
        );
        if (pickedFile != null) {
          for (var i in pickedFile) {
            // setState(() {
            // widget.attachment = File(i.path);
            widget.updateImage(File(i.path));
            // });
          }
        }
      }
    } else {
      var result = await deviceInfo.androidInfo;
      debugPrint(result.version.release);
      if (result.version.sdkInt < 33) {
        var status = await Permission.storage.request();
        if (status.isDenied) {
          showError("Permission Denied");
        } else {
          final pickedFile = await ImagesPicker.pick();
          if (pickedFile != null) {
            widget.updateImage(File(pickedFile[0].path));
          }
        }
      } else {
        var status = await Permission.photos.request();
        if (status.isDenied) {
          showError("Permission Denied");
        } else {
          final pickedFile =
              await picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            widget.updateImage(File(pickedFile.path));
          }
        }
      }
    }
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

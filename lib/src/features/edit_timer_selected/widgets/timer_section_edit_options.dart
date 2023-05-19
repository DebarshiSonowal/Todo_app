import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/features/edit_timer_selected/widgets/edit_time_selected_card.dart';
import 'package:vishal_todo_app/src/helper/vibrationDialog.dart';
import 'package:vishal_todo_app/src/helper/volumeDialog.dart';
import 'package:vishal_todo_app/src/repository/repository.dart';
import 'package:vishal_todo_app/src/services/Navigate.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../models/timer_section_option_model.dart';
import '../../../widget/done_button.dart';
import '../../timer_selected/widgets/time_selector_page_card.dart';

class TimerSectionEditOptions extends StatefulWidget {
  const TimerSectionEditOptions({
    super.key,
    required this.list,
    required this.options,
    required this.index1,
    required this.index2,
    this.type,
  });

  final int? type;
  final int index1, index2;
  final List<String> list;
  final TimerSelectionOptions options;

  @override
  State<TimerSectionEditOptions> createState() =>
      _TimerSectionEditOptionsState();
}

class _TimerSectionEditOptionsState extends State<TimerSectionEditOptions> {
  File? pickedFile;
  double? volume;
  bool? vibration;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 2.h,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff3c404f).withOpacity(0.6),
          // color: Colors.transparent,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          // shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigation.instance.navigate(Routes.ringTonePicker,
                          args:
                              "${widget.type == null ? 1 : 2},${widget.index1},${widget.index2}");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.list[index],
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                fontSize: 14.sp,
                                color: Constances.editTimeSelectedCardTextColor,
                                fontFamily: "PublicSans",
                                // fontWeight: FontWeight.bold,
                              ),
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  getCorrectValue(index, widget.options)
                                              .length >
                                          15
                                      ? getCorrectValue(index, widget.options)
                                          .substring(0, 15)
                                      : getCorrectValue(index, widget.options),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                        fontFamily: "PublicSans",
                                        // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            index == 1
                                ? SizedBox(
                                    width: 1.w,
                                  )
                                : Container(),
                            index == 1
                                ? Image.asset(
                                    Constances.speakerImage,
                                    // color: Colors.white,
                                    fit: BoxFit.fill,
                                    height: 12.sp,
                                    width: 12.sp,
                                  )
                                : Container(),
                            Image.asset(
                              Constances.nextImage,
                              // color: Colors.white,
                              fit: BoxFit.fill,
                              height: 12.sp,
                              width: 12.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const CustomDivider();
                },
                itemCount: widget.list.length),
            DoneButton(
              txt: "Save",
              onTap: () {
                saveData(widget.index1, widget.index2, widget.type);
                // Navigation.instance.goBack();
              },
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }

  String getCorrectValue(int index, TimerSelectionOptions options) {
    switch (index) {
      case 2:
        return (options.vibration ?? false) ? "On" : "Off";

      case 1:
        return "${volume ?? options.volume}";
      default:
        return pickedFile == null
            ? ((options.ringtone ?? "")
                .split("/")
                .last
                .split(".")[0]
                .replaceAll("_", " ")
                .capitalize())
            : ((pickedFile!.path) ?? "").split("/").last;
    }
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'mp4'],
    );
    setState(() {
      pickedFile = File(result!.files.first.path!);
    });
  }

  void saveData(int index, int index2, int? type) {

    Navigation.instance.goBack();
  }
  void goBack(int index, int index2, int? type){
    if (type == null) {
      Provider.of<Repository>(context, listen: false).updateTimerOptions(
        TimerSelectionOptions(
            pickedFile?.path ?? "NA", volume ?? 10, vibration),
        index,
        index2,
      );
    } else {
      Provider.of<Repository>(context, listen: false)
          .updateTimerOptionsPersonal(
        TimerSelectionOptions(
            pickedFile?.path ?? "NA", volume ?? 10, vibration),
        index,
        index2,
      );
    }
  }

  void _volumeUpdate(context) async {
    final result = await showDialog<double>(
      context: context,
      builder: (context) => VolumeDialog(
        initialVolume: widget.options.volume ?? 10,
      ),
    );
    if (result != null) {
      setState(() {
        volume = result;
      });
    }
  }

  void _updateVibrations(context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => VibrationDialog(
        initialVibration: widget.options.vibration ?? false,
      ),
    );
    if (result != null) {
      setState(() {
        vibration = result;
      });
    }
  }
}

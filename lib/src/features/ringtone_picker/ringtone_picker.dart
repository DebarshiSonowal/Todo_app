import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:vishal_todo_app/src/features/edit_timer_selected/widgets/edit_time_selected_card.dart';

import '../../constants/constants.dart';
import '../../models/timer_section_option_model.dart';
import '../../repository/repository.dart';
import '../timer_selected/widgets/timer_selected_appbar.dart';

class RingtonePickerScreen extends StatefulWidget {
  const RingtonePickerScreen({
    Key? key,
    required this.input,
  }) : super(key: key);
  final String input;

  @override
  State<RingtonePickerScreen> createState() => _RingtonePickerScreenState();
}

class _RingtonePickerScreenState extends State<RingtonePickerScreen> {
  late Future<List<String>> alertTones;

  @override
  void initState() {
    alertTones = getAlertList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(9.h),
        child: const TimerSelectAppbar(
          showDelete: false,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              Constances.backgroundImage,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        // padding: EdgeInsets.symmetric(
        //   vertical: 5.h,
        //   // horizontal: 5.w,
        // ),
        child: Consumer<Repository>(builder: (context, data, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      'MODE',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12.sp,
                            color: Constances.specialTextColor,
                            fontFamily: "PublicSans",
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.7.h,
                ),
                Container(
                  width: double.infinity,
                  height: 7.h,
                  color: const Color(0xff2c3550),
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Vibration',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontFamily: "PublicSans",
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                      CupertinoSwitch(
                        activeColor: Constances.switchActiveColor,
                        value: getValueOfSwitch(
                          int.parse(widget.input.split(",")[0]),
                          int.parse(widget.input.split(",")[1]),
                          int.parse(widget.input.split(",")[2]),
                          data,
                        ),
                        onChanged: (bool value) {
                          updateSwitch(
                              int.parse(widget.input.split(",")[0]),
                              int.parse(widget.input.split(",")[1]),
                              int.parse(widget.input.split(",")[2]),
                              data,
                              value);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      'SOUND',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12.sp,
                            color: Constances.specialTextColor,
                            fontFamily: "PublicSans",
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.7.h,
                ),
                Container(
                  width: double.infinity,
                  height: 7.h,
                  color: const Color(0xff2c3550),
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Constances.mute,
                        color: const Color(0xff787878),
                        height: 20.sp,
                        width: 20.sp,
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 2.0,
                            minThumbSeparation: 2,
                            thumbColor: Colors.white,
                            thumbShape:
                                const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayColor: const Color(0xff787878),

                            // inactiveTickMarkColor: Colors.amber,
                            inactiveTrackColor: const Color(0xff787878),
                          ),
                          child: Slider(
                            value: getValueOfSlider(
                              int.parse(widget.input.split(",")[0]),
                              int.parse(widget.input.split(",")[1]),
                              int.parse(widget.input.split(",")[2]),
                              data,
                            ),
                            min: 10,
                            max: 100,
                            divisions: 10,
                            activeColor: Colors.green,
                            onChanged: (value) {
                              updateSlider(
                                int.parse(widget.input.split(",")[0]),
                                int.parse(widget.input.split(",")[1]),
                                int.parse(widget.input.split(",")[2]),
                                value,
                                data,
                              );
                            },
                          ),
                        ),
                      ),
                      Image.asset(
                        Constances.fullVolume,
                        color: const Color(0xff787878),
                        height: 20.sp,
                        width: 20.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      'ALERT TONE',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontSize: 12.sp,
                            color: Constances.specialTextColor,
                            fontFamily: "PublicSans",
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.7.h,
                ),
                Container(
                  width: double.infinity,
                  // height: 7.h,
                  color: const Color(0xff2c3550),
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.h,
                  ),
                  child: FutureBuilder<List<String>>(
                    future: alertTones,
                    builder: (context, AsyncSnapshot<List<String>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = snapshot.data![index];
                            return GestureDetector(
                              onTap: () => updateVolume(
                                int.parse(widget.input.split(",")[0]),
                                int.parse(widget.input.split(",")[1]),
                                int.parse(widget.input.split(",")[2]),
                                data,
                                item,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: ifSelected(
                                              int.parse(
                                                  widget.input.split(",")[0]),
                                              int.parse(
                                                  widget.input.split(",")[1]),
                                              int.parse(
                                                  widget.input.split(",")[2]),
                                              data,
                                              item)
                                          ? const Color(0xffefc26b)
                                          : Colors.transparent,
                                      size: 13.sp,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      item
                                          .split("/")
                                          .last
                                          .replaceAll("_", " ")
                                          .split(".")[0]
                                          .capitalize(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(
                                            fontSize: 13.sp,
                                            color: Colors.white,
                                            fontFamily: "Sarabun",
                                            // fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w,
                                vertical: 0.5.h,
                              ),
                              child: const Divider(
                                color: Constances.dividerColor,
                              ),
                            );
                          },
                          itemCount: snapshot.data?.length ?? 0,
                        );
                      }
                      return Container();
                    },
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  getValueOfSwitch(int parse, int parse2, int parse3, Repository data) {
    if (parse == 1) {
      return data.models[parse2].reminders[parse3].options?.vibration ?? false;
    }
    return data.personals[parse2].reminders[parse3].isEnabled;
  }

  getValueOfSlider(int parse, int parse2, int parse3, Repository data) {
    if (parse == 1) {
      return data.models[parse2].reminders[parse3].options?.volume ?? 10;
    }
    return data.personals[parse2].reminders[parse3].options?.volume ?? 10;
  }

  void updateSlider(
      int parse, int parse2, int parse3, double value, Repository data) {
    if (parse == 1) {
      Provider.of<Repository>(context, listen: false).updateTimerOptions(
        TimerSelectionOptions(
          data.models[parse2].reminders[parse3].options?.ringtone ?? "NA",
          value,
          data.models[parse2].reminders[parse3].options?.vibration ?? false,
        ),
        parse2,
        parse3,
      );
    } else {
      Provider.of<Repository>(context, listen: false)
          .updateTimerOptionsPersonal(
        TimerSelectionOptions(
          data.personals[parse2].reminders[parse3].options?.ringtone ?? "NA",
          value,
          data.personals[parse2].reminders[parse3].options?.vibration ?? false,
        ),
        parse2,
        parse3,
      );
    }
  }

  void updateSwitch(
      int parse, int parse2, int parse3, Repository data, bool value) {
    if (parse == 1) {
      Provider.of<Repository>(context, listen: false).updateTimerOptions(
        TimerSelectionOptions(
          data.models[parse2].reminders[parse3].options?.ringtone ?? "NA",
          data.models[parse2].reminders[parse3].options?.volume ?? 10,
          value,
        ),
        parse2,
        parse3,
      );
    } else {
      Provider.of<Repository>(context, listen: false)
          .updateTimerOptionsPersonal(
        TimerSelectionOptions(
          data.personals[parse2].reminders[parse3].options?.ringtone ?? "NA",
          data.personals[parse2].reminders[parse3].options?.volume ?? 10,
          value,
        ),
        parse2,
        parse3,
      );
    }
  }

  Future<List<String>> getAlertList() async {
    final tones = json
        .decode(await rootBundle.loadString('AssetManifest.json'))
        .keys
        .where((String key) => key.contains('assets/audio/'))
        .toList();
    return tones;
  }

  updateVolume(
      int parse, int parse2, int parse3, Repository data, String item) {
    if (parse == 1) {
      Provider.of<Repository>(context, listen: false).updateTimerOptions(
        TimerSelectionOptions(
          item,
          data.models[parse2].reminders[parse3].options?.volume ?? 10,
          data.models[parse2].reminders[parse3].options?.vibration ?? false,
        ),
        parse2,
        parse3,
      );
    } else {
      Provider.of<Repository>(context, listen: false)
          .updateTimerOptionsPersonal(
        TimerSelectionOptions(
          item,
          data.models[parse2].reminders[parse3].options?.volume ?? 10,
          data.models[parse2].reminders[parse3].options?.vibration ?? false,
        ),
        parse2,
        parse3,
      );
    }
  }

  ifSelected(int parse, int parse2, int parse3, Repository data, String item) {
    if (parse == 1) {
      return (data.models[parse2].reminders[parse3].options?.ringtone ??
              "NA") ==
          item;
    }
    return (data.personals[parse2].reminders[parse3].options?.ringtone ??
            "NA") ==
        item;
  }
}
